# Building the macOS and Windows standalones

Copyright (c) Dmitrii Shchukin 2026

## English

### Requirements

- Max 8.6 or later on the operating system being built;
- bach 0.8.2 or later installed through Max Package Manager;
- a licensed Max installation with standalone building enabled.

A macOS application must be built in Max on macOS. A Windows application must
be built in Max on Windows. Max does not cross-compile standalones.

### Prepare the source

1. Open a terminal in the repository root.
2. Run `node standalone/tools/create_build_source.js`.
3. Open `standalone/build-source/WebernCompositionalModel.maxpat` in Max.
4. Save once on the current platform so Max refreshes its platform-specific
   dependency cache (`.mxo` on macOS or `.mxe64` on Windows).
5. Confirm in the Max Console that there are no red errors and that
   `bach.score`, `bach.quantize`, `bach.playkeys`, `bach.join`, and the internal
   `bach.roll` object load correctly.

With Max 8.1 or later and bach 0.8.1 or later, bach's own standalone tutorial
states that its package handling is automatic. The explicit source-folder
inclusion below is still required for this project's dynamically loaded JSON
profiles and for its legal notices.

### Build on macOS

1. With the standalone patch frontmost, choose **File -> Build Collective /
   Application...**.
2. In the Collective Editor, keep the generated patch as the top-level patcher.
3. Select **Include Folder...** and choose `standalone/build-source`. This
   explicitly embeds the JavaScript engine, JSON profiles, audition voice,
   licences, and notices. The folder has no nested runtime dependencies.
4. Select **Build**, choose file type **Application**, and save the result as
   `WebernCompositionalModel.app`.
5. Quit Max and launch the application. Test Build Score, Play, Stop, and Export
   XML.
6. Create the transport archive:

   ```sh
   sh standalone/packaging/macos/package_macos.sh \
     "/absolute/path/WebernCompositionalModel.app" \
     "/absolute/path/WebernCompositionalModel-macOS-universal.zip"
   ```

### Build on Windows

1. Repeat the source preparation in Max 8 for Windows and save the patch once.
2. With the patch frontmost, choose **File -> Build Collective / Application...**.
3. Select **Include Folder...** and choose `standalone\build-source`.
4. Select **Build**, choose file type **Application**, and save into a new
   folder named `WebernCompositionalModel-Windows`. The folder must contain
   `WebernCompositionalModel.exe`, `WebernCompositionalModel.mxf`, and `support`.
5. Test the application from that folder before packaging.
6. In PowerShell, create the one-file release:

   ```powershell
   powershell -ExecutionPolicy Bypass -File `
     standalone\packaging\windows\package_windows_onefile.ps1 `
     -BuildFolder "C:\absolute\path\WebernCompositionalModel-Windows" `
     -OutputExe "C:\absolute\path\WebernCompositionalModel-Windows-x64.exe"
   ```

The one-file Windows launcher extracts its private runtime to a temporary
directory, runs the program, waits for it to close, and removes the temporary
copy. It does not install Max and does not place support files next to itself.

### Final handoff

Upload both release files and the build logs or screenshots. The final release
check records file sizes, SHA-256 hashes, the Max version, the bach version, and
a successful launch on each platform.

Official references: Cycling '74, *Standalones and Collectives*,
https://docs.cycling74.com/userguide/standalones_and_collectives/; Cycling '74,
*Projects*, https://docs.cycling74.com/userguide/projects/; bach project,
https://www.bachproject.net/.

## Deutsch

### Voraussetzungen

- Max 8.6 oder neuer auf dem jeweiligen Build-System;
- bach 0.8.2 oder neuer, installiert über den Max Package Manager;
- eine autorisierte Max-Installation mit freigeschaltetem Standalone-Build.

Die macOS-Anwendung muss unter macOS, die Windows-Anwendung unter Windows gebaut
werden. Max erzeugt keine plattformfremden Standalones.

### Quelle vorbereiten

1. Ein Terminal im Stammverzeichnis des Repositoriums öffnen.
2. `node standalone/tools/create_build_source.js` ausführen.
3. `standalone/build-source/WebernCompositionalModel.maxpat` in Max öffnen.
4. Den Patch auf der aktuellen Plattform einmal speichern, damit Max den
   plattformspezifischen Abhängigkeits-Cache aktualisiert (`.mxo` beziehungsweise
   `.mxe64`).
5. In der Max Console prüfen, dass keine roten Fehlermeldungen erscheinen und
   `bach.score`, `bach.quantize`, `bach.playkeys`, `bach.join` sowie das interne
   `bach.roll` korrekt geladen werden.

### macOS-Build

1. Den Standalone-Patch in den Vordergrund bringen und **File -> Build
   Collective / Application...** wählen.
2. Im Collective Editor den erzeugten Patch als Top-Level-Patcher belassen.
3. **Include Folder...** wählen und `standalone/build-source` hinzufügen. Damit
   werden JavaScript-Engine, JSON-Profile, Audiostimme, Lizenzen und Hinweise
   explizit eingebettet.
4. **Build** wählen, als Dateityp **Application** einstellen und als
   `WebernCompositionalModel.app` sichern.
5. Max beenden, die Anwendung starten und Build Score, Play, Stop sowie Export
   XML prüfen.
6. Das Transportarchiv mit `package_macos.sh` gemäß dem englischen Beispiel
   erzeugen.

### Windows-Build

1. Die Quellvorbereitung in Max 8 für Windows wiederholen und den Patch einmal
   speichern.
2. **File -> Build Collective / Application...** wählen.
3. Über **Include Folder...** den Ordner `standalone\build-source` hinzufügen.
4. Als **Application** in einen neuen Ordner
   `WebernCompositionalModel-Windows` bauen. Er muss die EXE-, MXF- und
   Support-Komponenten enthalten.
5. Die Anwendung vor dem Verpacken direkt aus diesem Ordner prüfen.
6. Mit `package_windows_onefile.ps1` gemäß dem englischen PowerShell-Beispiel
   die Ein-Datei-Ausgabe erzeugen.

Der Windows-Launcher entpackt seine private Laufzeitumgebung temporär, wartet
auf das Schließen der Anwendung und entfernt die temporäre Kopie. Neben der EXE
werden keine Support-Dateien angelegt.

### Abschluss

Beide Release-Dateien sowie Build-Protokolle oder Screenshots hochladen. Die
Endkontrolle dokumentiert Dateigrößen, SHA-256-Prüfsummen, Max- und bach-Version
sowie einen erfolgreichen Start auf beiden Plattformen.

## Русский

### Требования

- Max 8.6 или новее на той операционной системе, для которой собирается версия;
- bach 0.8.2 или новее, установленный через Max Package Manager;
- авторизованная установка Max с доступной сборкой standalone-приложений.

macOS-приложение собирается в Max на macOS, Windows-приложение - в Max на
Windows. Max не выполняет кросс-компиляцию standalone между платформами.

### Подготовка исходника

1. Открыть терминал в корне репозитория.
2. Выполнить `node standalone/tools/create_build_source.js`.
3. Открыть `standalone/build-source/WebernCompositionalModel.maxpat` в Max.
4. Один раз сохранить патч на текущей платформе, чтобы Max обновил кэш
   платформенных зависимостей (`.mxo` на macOS или `.mxe64` на Windows).
5. Убедиться в Max Console, что нет красных ошибок и корректно загружены
   `bach.score`, `bach.quantize`, `bach.playkeys`, `bach.join`, а также внутренний
   объект `bach.roll`.

### Сборка macOS

1. Вывести окно standalone-патча на передний план и выбрать **File -> Build
   Collective / Application...**.
2. В Collective Editor оставить подготовленный патч как top-level patcher.
3. Нажать **Include Folder...** и выбрать `standalone/build-source`. Так внутрь
   явно попадут JavaScript-движок, JSON-профили, синтезатор, лицензии и notices.
4. Нажать **Build**, выбрать тип **Application** и сохранить как
   `WebernCompositionalModel.app`.
5. Закрыть Max, запустить приложение и проверить Build Score, Play, Stop и
   Export XML.
6. Создать архив скриптом `package_macos.sh` по примеру из английского раздела.

### Сборка Windows

1. Повторить подготовку исходника в Max 8 для Windows и один раз сохранить
   патч.
2. Выбрать **File -> Build Collective / Application...**.
3. Через **Include Folder...** добавить `standalone\build-source`.
4. Собрать тип **Application** в новую папку
   `WebernCompositionalModel-Windows`. В ней должны находиться EXE, MXF и папка
   `support`.
5. До упаковки проверить запуск приложения из этой папки.
6. По PowerShell-примеру из английского раздела запустить
   `package_windows_onefile.ps1` и получить единый EXE.

Единый Windows-файл распаковывает собственный runtime во временную папку,
запускает программу, ждёт её закрытия и удаляет временную копию. Max не
устанавливается, а рядом с EXE не появляются дополнительные файлы.

### Финальная передача

Загрузить оба release-файла и логи либо скриншоты сборки. Финальная проверка
зафиксирует размеры, SHA-256, версии Max и bach, а также успешный запуск на обеих
платформах.
