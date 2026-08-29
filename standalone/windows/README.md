# Windows standalone

Copyright (c) Dmitrii Shchukin 2026

This directory is the Windows build lane for **Computational Modeling of
Webern's Op. 10**. The final user receives one self-extracting
`WebernCompositionalModel-Windows-x64.exe`; Max and bach do not need to be
installed on the user's computer and no installer is run.

## Build once in Max 8

1. Open `build-source\\WebernCompositionalModel.maxpat` in Max on Windows.
2. Save the patch once and confirm that no red errors appear in the Max Console.
3. Choose **File → Build Collective / Application…**.
4. In the Collective Editor choose **Include Folder…** and select this complete
   `build-source` folder.
5. Choose **Build → Application** and save into a new folder named
   `WebernCompositionalModel-Windows`.
6. Quit Max. From the generated folder launch
   `WebernCompositionalModel.exe` and test **Build Score**, **Play**, **Stop**
   and **Export XML**.
7. In PowerShell, from the repository root, run:

   ```powershell
   powershell -ExecutionPolicy Bypass -File standalone\\packaging\\windows\\package_windows_onefile.ps1 -BuildFolder "C:\\absolute\\path\\WebernCompositionalModel-Windows" -OutputExe "standalone\\windows\\release\\WebernCompositionalModel-Windows-x64.exe"
   ```

Upload the EXE together with the Max Console build log or a screenshot. The
release is final only after the one-file launcher has been tested on Windows
without Max.
