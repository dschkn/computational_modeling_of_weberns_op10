#!/usr/bin/env python3
"""Build the three standalone user guides. Copyright (c) Dmitrii Shchukin 2026."""

from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate,
    Frame,
    KeepTogether,
    PageBreak,
    PageTemplate,
    Paragraph,
    Spacer,
)


ROOT = Path(__file__).resolve().parents[2]
OUTPUT = ROOT / "standalone" / "guides"

FONT_REGULAR = "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
FONT_BOLD = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"
FONT_ITALIC = FONT_REGULAR

pdfmetrics.registerFont(TTFont("GuideSans", FONT_REGULAR))
pdfmetrics.registerFont(TTFont("GuideSans-Bold", FONT_BOLD))
pdfmetrics.registerFont(TTFont("GuideSans-Italic", FONT_ITALIC))
pdfmetrics.registerFontFamily(
    "GuideSans",
    normal="GuideSans",
    bold="GuideSans-Bold",
    italic="GuideSans-Italic",
    boldItalic="GuideSans-Bold",
)


GUIDES = {
    "USER_GUIDE_EN.pdf": {
        "lang": "English",
        "title": "Computational Modeling of Webern's Op. 10",
        "subtitle": "Standalone application - User guide",
        "page_break_before": "Controls",
        "sections": [
            (
                "Purpose",
                [
                    "The application is a research-informed generative score environment based primarily on Anton Webern's <i>Five Pieces for Orchestra</i>, op. 10. It creates a ten-staff <i>bach.score</i>, provides a built-in reference synthesis, and exports MusicXML. It is an analytical composition instrument rather than a substitute for editorial or historical source study."
                ],
            ),
            (
                "Opening the application",
                [
                    "<b>macOS:</b> unpack the release ZIP, move <i>WebernCompositionalModel.app</i> to a stable location, and open it. Because the research build is not notarized, the first launch may require Control-clicking the application and selecting <i>Open</i>.",
                    "<b>Windows:</b> launch <i>WebernCompositionalModel-Windows-x64.exe</i>. The single file opens a private temporary runtime, starts the program, and removes the temporary copy after the application closes. A first launch may display Microsoft SmartScreen because the research build is not code-signed; proceed only when the file's SHA-256 matches the official release note.",
                    "Max is not required on the end user's computer. No supporting files need to be placed next to the application."
                ],
            ),
            (
                "Controls",
                [
                    "<b>Profile</b> selects the general op. 10 synthesis or one of five differentiated movement models. <b>Seed</b> identifies a reproducible realization. Entering the same seed with the same parameters recreates the same material.",
                    "<b>BPM</b> defines the basic tempo. Coherence, Metamorphosis, Symmetry, Timbral contrast, Lyrical breath, Silence, Texture density, and Events govern the statistical and formal disposition of the model.",
                    "The <b>Activity / Time</b> curve controls event density across the form. The <b>Dynamics / Time</b> curve controls the global dynamic trajectory. The horizontal axis represents formal time; the vertical axis represents the respective normalized value or notated dynamic level.",
                    "<b>Generate Material</b> prepares a new row and internal material. <b>Build Score</b> reads the current controls and curves, then produces a complete score. The displayed row corresponds to the first aggregate realized in the score.",
                    "<b>Play</b> starts the internal reference synthesizer; <b>Stop</b> stops playback. <b>Clear</b> removes the current score. <b>Export XML</b> writes a MusicXML file through the operating system's save dialog."
                ],
            ),
            (
                "Recommended workflow",
                [
                    "1. Select a profile and enter a seed. 2. Set tempo and formal parameters. 3. Draw the two time curves. 4. Select <i>Generate Material</i>. 5. Select <i>Build Score</i>. 6. Inspect the score and audition it with <i>Play</i>. 7. Revise parameters or export MusicXML.",
                    "The built-in sound is a neutral reference synthesis. Instrumental identity, balance, articulation, and phrase direction should be evaluated from the notation and, where appropriate, in rehearsal or with dedicated orchestral playback tools."
                ],
            ),
            (
                "Troubleshooting and scope",
                [
                    "If playback is silent, stop playback, verify that the computer has an active audio output, relaunch the application, and select Play again. If MusicXML export appears incomplete, choose a new writable destination and repeat the export.",
                    "The macOS and Windows releases contain the same compositional model. Small visual differences can result from operating-system font rendering. Generated scores remain editable research outputs and should be reviewed before performance."
                ],
            ),
        ],
        "references": "Technical references: Cycling '74, Standalones and Collectives, https://docs.cycling74.com/userguide/standalones_and_collectives/; bach project, https://www.bachproject.net/.",
    },
    "BENUTZERHANDBUCH_DE.pdf": {
        "lang": "Deutsch",
        "title": "Computational Modeling of Webern's Op. 10",
        "subtitle": "Standalone-Anwendung - Benutzerhandbuch",
        "page_break_before": "Bedienelemente",
        "sections": [
            (
                "Zweck",
                [
                    "Die Anwendung ist eine forschungsbasierte generative Partiturumgebung, die sich vor allem auf Anton Weberns <i>Fünf Stücke für Orchester</i> op. 10 bezieht. Sie erzeugt eine zehnstimmige <i>bach.score</i>-Partitur, stellt eine interne Referenzsynthese bereit und exportiert MusicXML. Das Programm ist ein analytisches Kompositionsinstrument und ersetzt weder Quellenkritik noch historische Editionsarbeit."
                ],
            ),
            (
                "Anwendung öffnen",
                [
                    "<b>macOS:</b> Das Release-ZIP entpacken, <i>WebernCompositionalModel.app</i> an einen festen Ort verschieben und öffnen. Da der Forschungs-Build nicht notarisiert ist, kann beim ersten Start ein Control-Klick auf die Anwendung und anschließend <i>Öffnen</i> erforderlich sein.",
                    "<b>Windows:</b> <i>WebernCompositionalModel-Windows-x64.exe</i> starten. Die einzelne Datei öffnet eine private temporäre Laufzeitumgebung, startet das Programm und entfernt die temporäre Kopie nach dem Schließen. Microsoft SmartScreen kann beim ersten Start erscheinen, da der Forschungs-Build nicht codesigniert ist; nur fortfahren, wenn die SHA-256-Prüfsumme mit der offiziellen Release-Notiz übereinstimmt.",
                    "Auf dem Rechner des Endnutzers ist Max nicht erforderlich. Neben der Anwendung müssen keine Support-Dateien abgelegt werden."
                ],
            ),
            (
                "Bedienelemente",
                [
                    "<b>Profile</b> wählt die allgemeine op.-10-Synthese oder eines von fünf differenzierten Satzmodellen. <b>Seed</b> bezeichnet eine reproduzierbare Realisierung. Derselbe Seed erzeugt bei unveränderten Parametern dasselbe Material.",
                    "<b>BPM</b> bestimmt das Grundtempo. Coherence, Metamorphosis, Symmetry, Timbral contrast, Lyrical breath, Silence, Texture density und Events regeln die statistische und formale Disposition des Modells.",
                    "Die Kurve <b>Activity / Time</b> steuert die Ereignisdichte im Formverlauf. <b>Dynamics / Time</b> bestimmt den globalen dynamischen Verlauf. Die horizontale Achse bezeichnet die Formzeit, die vertikale Achse den jeweiligen normierten Wert beziehungsweise die notierte Dynamikstufe.",
                    "<b>Generate Material</b> erzeugt eine neue Reihe und das interne Material. <b>Build Score</b> liest die aktuellen Einstellungen und Kurven und erstellt die vollständige Partitur. Die angezeigte Reihe entspricht dem ersten in der Partitur realisierten Aggregat.",
                    "<b>Play</b> startet die interne Referenzsynthese; <b>Stop</b> beendet die Wiedergabe. <b>Clear</b> löscht die aktuelle Partitur. <b>Export XML</b> schreibt über den Speicherdialog des Betriebssystems eine MusicXML-Datei."
                ],
            ),
            (
                "Empfohlener Arbeitsablauf",
                [
                    "1. Profil wählen und Seed eingeben. 2. Tempo und Formparameter einstellen. 3. Beide Zeitkurven zeichnen. 4. <i>Generate Material</i> wählen. 5. <i>Build Score</i> wählen. 6. Partitur prüfen und mit <i>Play</i> abhören. 7. Parameter überarbeiten oder MusicXML exportieren.",
                    "Der interne Klang ist eine neutrale Referenzsynthese. Instrumentale Identität, Balance, Artikulation und Phrasierung sind anhand der Notation und gegebenenfalls in einer Probe oder mit spezialisierten Orchesterwerkzeugen zu beurteilen."
                ],
            ),
            (
                "Fehlerbehebung und Geltungsbereich",
                [
                    "Falls kein Klang hörbar ist, die Wiedergabe stoppen, einen aktiven Audioausgang des Rechners prüfen, die Anwendung neu starten und erneut Play wählen. Bei unvollständigem MusicXML-Export einen anderen beschreibbaren Speicherort wählen.",
                    "macOS- und Windows-Ausgabe enthalten dasselbe Kompositionsmodell. Geringe visuelle Abweichungen können aus der Schriftwiedergabe des Betriebssystems entstehen. Generierte Partituren bleiben editierbare Forschungsergebnisse und sind vor einer Aufführung zu prüfen."
                ],
            ),
        ],
        "references": "Technische Referenzen: Cycling '74, Standalones and Collectives, https://docs.cycling74.com/userguide/standalones_and_collectives/; bach project, https://www.bachproject.net/.",
    },
    "RUKOVODSTVO_RU.pdf": {
        "lang": "Русский",
        "title": "Computational Modeling of Webern's Op. 10",
        "subtitle": "Автономное приложение - руководство пользователя",
        "page_break_before": "Органы управления",
        "sections": [
            (
                "Назначение",
                [
                    "Приложение представляет собой исследовательскую генеративную среду, основанную прежде всего на <i>Пяти пьесах для оркестра</i> op. 10 Антона Веберна. Оно создаёт десятистановую партитуру <i>bach.score</i>, воспроизводит её встроенным референс-синтезатором и экспортирует MusicXML. Это аналитический композиционный инструмент, а не замена критической работе с историческими источниками."
                ],
            ),
            (
                "Запуск приложения",
                [
                    "<b>macOS:</b> распакуйте релизный ZIP, переместите <i>WebernCompositionalModel.app</i> в постоянную папку и откройте приложение. Поскольку исследовательская сборка не прошла нотарификацию Apple, при первом запуске может потребоваться нажать приложение с клавишей Control и выбрать <i>Open</i>.",
                    "<b>Windows:</b> запустите <i>WebernCompositionalModel-Windows-x64.exe</i>. Единый файл раскрывает собственный runtime во временную папку, запускает программу и удаляет временную копию после закрытия. Microsoft SmartScreen может показать предупреждение, поскольку исследовательская сборка не подписана; продолжайте только при совпадении SHA-256 с официальной записью release.",
                    "На компьютере конечного пользователя Max не требуется. Рядом с приложением не нужно размещать вспомогательные файлы."
                ],
            ),
            (
                "Органы управления",
                [
                    "<b>Profile</b> выбирает общую модель op. 10 или одну из пяти дифференцированных моделей пьес. <b>Seed</b> задаёт воспроизводимую реализацию. Одинаковый seed при неизменных параметрах возвращает тот же материал.",
                    "<b>BPM</b> определяет базовый темп. Coherence, Metamorphosis, Symmetry, Timbral contrast, Lyrical breath, Silence, Texture density и Events управляют статистической и формальной организацией модели.",
                    "Кривая <b>Activity / Time</b> задаёт плотность событий во времени формы. <b>Dynamics / Time</b> определяет глобальную динамическую траекторию. Горизонтальная ось обозначает формальное время, вертикальная - нормированное значение либо точный динамический уровень.",
                    "<b>Generate Material</b> создаёт новый ряд и внутренний материал. <b>Build Score</b> считывает текущие параметры и кривые, затем строит полную партитуру. Показанный ряд соответствует первому агрегату, реализованному в партитуре.",
                    "<b>Play</b> запускает встроенный референс-синтезатор; <b>Stop</b> прекращает воспроизведение. <b>Clear</b> удаляет текущую партитуру. <b>Export XML</b> записывает MusicXML через системное окно сохранения."
                ],
            ),
            (
                "Рекомендуемый порядок работы",
                [
                    "1. Выберите профиль и введите seed. 2. Настройте темп и формальные параметры. 3. Нарисуйте обе временные кривые. 4. Нажмите <i>Generate Material</i>. 5. Нажмите <i>Build Score</i>. 6. Изучите партитуру и прослушайте её через <i>Play</i>. 7. Скорректируйте параметры либо экспортируйте MusicXML.",
                    "Встроенный звук является нейтральной референс-синтезой. Инструментальную идентичность, баланс, артикуляцию и фразировку следует оценивать по нотации, а при необходимости - на репетиции или с помощью специализированных оркестровых инструментов воспроизведения."
                ],
            ),
            (
                "Устранение неполадок и границы модели",
                [
                    "Если звук отсутствует, остановите воспроизведение, убедитесь, что в системе активен аудиовыход, перезапустите приложение и снова нажмите Play. Если экспорт MusicXML не завершён, выберите другую доступную для записи папку и повторите операцию.",
                    "Версии macOS и Windows содержат одну и ту же композиционную модель. Небольшие визуальные различия могут быть связаны с отрисовкой шрифтов в операционной системе. Сгенерированные партитуры остаются редактируемыми результатами исследования и требуют проверки перед исполнением."
                ],
            ),
        ],
        "references": "Технические источники: Cycling '74, Standalones and Collectives, https://docs.cycling74.com/userguide/standalones_and_collectives/; bach project, https://www.bachproject.net/.",
    },
}


def styles():
    base = getSampleStyleSheet()
    return {
        "title": ParagraphStyle(
            "Title",
            parent=base["Title"],
            fontName="GuideSans-Bold",
            fontSize=18,
            leading=22,
            alignment=TA_LEFT,
            textColor=colors.black,
            spaceAfter=5 * mm,
        ),
        "subtitle": ParagraphStyle(
            "Subtitle",
            parent=base["Normal"],
            fontName="GuideSans",
            fontSize=10.5,
            leading=14,
            textColor=colors.black,
            spaceAfter=8 * mm,
        ),
        "heading": ParagraphStyle(
            "Heading",
            parent=base["Heading2"],
            fontName="GuideSans-Bold",
            fontSize=11.5,
            leading=15,
            textColor=colors.black,
            spaceBefore=4 * mm,
            spaceAfter=2 * mm,
            keepWithNext=True,
        ),
        "body": ParagraphStyle(
            "Body",
            parent=base["BodyText"],
            fontName="GuideSans",
            fontSize=9.2,
            leading=13.2,
            alignment=TA_LEFT,
            textColor=colors.black,
            spaceAfter=2.2 * mm,
        ),
        "meta": ParagraphStyle(
            "Meta",
            parent=base["BodyText"],
            fontName="GuideSans",
            fontSize=7.8,
            leading=10.5,
            textColor=colors.black,
        ),
    }


def footer(canvas, doc, language):
    canvas.saveState()
    canvas.setStrokeColor(colors.black)
    canvas.setLineWidth(0.35)
    canvas.line(18 * mm, 14 * mm, A4[0] - 18 * mm, 14 * mm)
    canvas.setFont("GuideSans", 7.5)
    canvas.setFillColor(colors.black)
    canvas.drawString(18 * mm, 9.5 * mm, f"{language} - Copyright (c) Dmitrii Shchukin 2026")
    canvas.drawRightString(A4[0] - 18 * mm, 9.5 * mm, str(doc.page))
    canvas.restoreState()


def build(filename, data):
    OUTPUT.mkdir(parents=True, exist_ok=True)
    output_path = OUTPUT / filename
    doc = BaseDocTemplate(
        str(output_path),
        pagesize=A4,
        leftMargin=18 * mm,
        rightMargin=18 * mm,
        topMargin=18 * mm,
        bottomMargin=20 * mm,
        title=data["title"],
        author="Dmitrii Shchukin",
        subject=data["subtitle"],
        creator="Dmitrii Shchukin",
    )
    frame = Frame(doc.leftMargin, doc.bottomMargin, doc.width, doc.height, id="main")
    doc.addPageTemplates(
        [PageTemplate(id="guide", frames=[frame], onPage=lambda c, d: footer(c, d, data["lang"]))]
    )

    style = styles()
    story = [
        Paragraph(data["title"], style["title"]),
        Paragraph(data["subtitle"], style["subtitle"]),
    ]

    for heading, paragraphs in data["sections"]:
        if heading == data["page_break_before"]:
            story.append(PageBreak())
        block = [Paragraph(heading, style["heading"])]
        block.extend(Paragraph(paragraph, style["body"]) for paragraph in paragraphs)
        story.append(KeepTogether(block[:2]))
        story.extend(block[2:])

    story.extend(
        [
            Spacer(1, 4 * mm),
            Paragraph(data["references"], style["meta"]),
            Spacer(1, 2 * mm),
            Paragraph(
                "Version 6.0.0 standalone edition. Copyright (c) Dmitrii Shchukin 2026.",
                style["meta"],
            ),
        ]
    )
    doc.build(story)
    return output_path


if __name__ == "__main__":
    for name, guide in GUIDES.items():
        print(build(name, guide))
