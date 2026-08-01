# Copyright (c) Dmitrii Shchukin 2026

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$BuildFolder,

    [Parameter(Mandatory = $true)]
    [string]$OutputExe
)

$ErrorActionPreference = "Stop"

$buildPath = (Resolve-Path -LiteralPath $BuildFolder).Path
$mainExe = Join-Path $buildPath "WebernCompositionalModel.exe"
$mainCollective = Join-Path $buildPath "WebernCompositionalModel.mxf"
$iexpress = Join-Path $env:WINDIR "System32\iexpress.exe"

if (-not (Test-Path -LiteralPath $mainExe -PathType Leaf)) {
    throw "Missing Max standalone executable: $mainExe"
}
if (-not (Test-Path -LiteralPath $mainCollective -PathType Leaf)) {
    throw "Missing Max collective: $mainCollective"
}
if (-not (Test-Path -LiteralPath $iexpress -PathType Leaf)) {
    throw "Windows IExpress is unavailable: $iexpress"
}

$outputPath = [System.IO.Path]::GetFullPath($OutputExe)
if ([System.IO.Path]::GetExtension($outputPath) -ne ".exe") {
    throw "The one-file output must use the .exe extension: $outputPath"
}
if (Test-Path -LiteralPath $outputPath) {
    throw "Refusing to overwrite existing output: $outputPath"
}
$outputDirectory = Split-Path -Parent $outputPath
if (-not (Test-Path -LiteralPath $outputDirectory -PathType Container)) {
    New-Item -ItemType Directory -Path $outputDirectory | Out-Null
}

$working = Join-Path $env:TEMP ("webern-onefile-" + [guid]::NewGuid().ToString("N"))
$payload = Join-Path $working "payload.zip"
$launcher = Join-Path $working "launch.cmd"
$sed = Join-Path $working "package.sed"

New-Item -ItemType Directory -Path $working | Out-Null

try {
    Compress-Archive -Path (Join-Path $buildPath "*") -DestinationPath $payload -CompressionLevel Optimal

    $launcherText = @'
@echo off
setlocal
set "APP_TMP=%TEMP%\WebernCompositionalModel_%RANDOM%_%RANDOM%"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; Expand-Archive -LiteralPath '%~dp0payload.zip' -DestinationPath '%APP_TMP%' -Force; $p=Start-Process -FilePath (Join-Path '%APP_TMP%' 'WebernCompositionalModel.exe') -Wait -PassThru; exit $p.ExitCode"
set "APP_RC=%ERRORLEVEL%"
rmdir /s /q "%APP_TMP%" >nul 2>&1
exit /b %APP_RC%
'@
    Set-Content -LiteralPath $launcher -Value $launcherText -Encoding Ascii

    $sedText = @"
[Version]
Class=IEXPRESS
SEDVersion=3

[Options]
PackagePurpose=InstallApp
ShowInstallProgramWindow=0
HideExtractAnimation=1
UseLongFileName=1
InsideCompressed=0
CAB_FixedSize=0
CAB_ResvCodeSigning=0
RebootMode=N
InstallPrompt=
DisplayLicense=
FinishMessage=
TargetName=$outputPath
FriendlyName=Webern Compositional Model
AppLaunched=launch.cmd
PostInstallCmd=<None>
AdminQuietInstCmd=
UserQuietInstCmd=
SourceFiles=SourceFiles

[SourceFiles]
SourceFiles0=$working\

[SourceFiles0]
%FILE0%=
%FILE1%=

[Strings]
FILE0="launch.cmd"
FILE1="payload.zip"
"@
    Set-Content -LiteralPath $sed -Value $sedText -Encoding Ascii

    & $iexpress /N /Q $sed
    if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath $outputPath -PathType Leaf)) {
        throw "IExpress did not create the one-file launcher. Exit code: $LASTEXITCODE"
    }

    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $outputPath
    Write-Output "Created: $outputPath"
    Write-Output "SHA-256: $($hash.Hash.ToLowerInvariant())"
}
finally {
    if (Test-Path -LiteralPath $working) {
        Remove-Item -LiteralPath $working -Recurse -Force
    }
}
