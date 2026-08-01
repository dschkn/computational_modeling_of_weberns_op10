# Standalone application builds

Copyright (c) Dmitrii Shchukin 2026

## English

This directory prepares **Computational Modeling of Webern's Op. 10** for two
standalone releases:

- `WebernCompositionalModel-macOS-universal.zip`, containing one visible
  `WebernCompositionalModel.app` bundle;
- `WebernCompositionalModel-Windows-x64.exe`, a single-file self-extracting
  launcher containing the complete Windows Max standalone.

The build source is an isolated derivative of `max/WebernPersona.maxpat`. The
original patch and every existing project file remain unchanged. The generated
copy adds only a hidden `standalone` configuration object and standalone window
settings. Max, the JavaScript engine, the movement profiles, the audition voice,
and the required bach externals are encapsulated by Max during the platform
build.

See `BUILDING_EN_DE_RU.md` for the exact handoff procedure. The `guides/`
directory contains end-user instructions in English, German, and Russian.

## Deutsch

Dieses Verzeichnis bereitet **Computational Modeling of Webern's Op. 10** für
zwei eigenständige Veröffentlichungen vor:

- `WebernCompositionalModel-macOS-universal.zip` mit dem im Finder als eine
  Datei erscheinenden Bundle `WebernCompositionalModel.app`;
- `WebernCompositionalModel-Windows-x64.exe` als selbstextrahierende
  Ein-Datei-Ausgabe des vollständigen Windows-Standalones.

Die Build-Quelle ist eine isolierte Ableitung von `max/WebernPersona.maxpat`.
Der ursprüngliche Patch und sämtliche vorhandenen Projektdateien bleiben
unverändert. Die erzeugte Kopie ergänzt ausschließlich eine verborgene
`standalone`-Konfiguration und die Fenstereinstellungen der Anwendung.

Die genaue Übergabe ist in `BUILDING_EN_DE_RU.md` beschrieben. Endnutzer-
Anleitungen auf Englisch, Deutsch und Russisch befinden sich in `guides/`.

## Русский

Эта папка подготавливает **Computational Modeling of Webern's Op. 10** к двум
автономным выпускам:

- `WebernCompositionalModel-macOS-universal.zip`, внутри которого находится
  один видимый bundle `WebernCompositionalModel.app`;
- `WebernCompositionalModel-Windows-x64.exe` - единый самораспаковывающийся
  файл с полной Windows-сборкой Max.

Исходник для сборки является изолированной производной копией
`max/WebernPersona.maxpat`. Оригинальный патч и все существовавшие файлы проекта
не изменяются. В копию добавляются только скрытый объект конфигурации
`standalone` и настройки окна приложения.

Точная процедура сборки приведена в `BUILDING_EN_DE_RU.md`. Пользовательские
инструкции на английском, немецком и русском находятся в `guides/`.

