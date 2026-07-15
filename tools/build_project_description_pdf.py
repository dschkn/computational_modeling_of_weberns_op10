#!/usr/bin/env python3
"""Build the trilingual scholarly project description.

Copyright (c) Dmitrii Shchukin 2026
"""

from pathlib import Path

from reportlab.lib.enums import TA_CENTER, TA_JUSTIFY, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfgen import canvas
from reportlab.platypus import Paragraph


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "docs" / "PROJECT_DESCRIPTION_EN_DE_RU.pdf"
FONT_DIR = Path("/usr/share/fonts/truetype/dejavu")

pdfmetrics.registerFont(TTFont("ProjectSerif", str(FONT_DIR / "DejaVuSerif.ttf")))
pdfmetrics.registerFont(TTFont("ProjectSerif-Bold", str(FONT_DIR / "DejaVuSerif-Bold.ttf")))
pdfmetrics.registerFont(TTFont("ProjectSerif-Italic", str(FONT_DIR / "DejaVuSerif.ttf")))
pdfmetrics.registerFontFamily(
    "ProjectSerif",
    normal="ProjectSerif",
    bold="ProjectSerif-Bold",
    italic="ProjectSerif-Italic",
    boldItalic="ProjectSerif-Bold",
)

W, H = A4
LEFT = 24 * mm
RIGHT = 24 * mm
WIDTH = W - LEFT - RIGHT


def style(name, size, leading, *, bold=False, italic=False, align=TA_JUSTIFY, before=0, after=0):
    font = "ProjectSerif-Bold" if bold else ("ProjectSerif-Italic" if italic else "ProjectSerif")
    return ParagraphStyle(
        name,
        fontName=font,
        fontSize=size,
        leading=leading,
        textColor=(0, 0, 0),
        alignment=align,
        spaceBefore=before,
        spaceAfter=after,
        allowWidows=0,
        allowOrphans=0,
    )


TITLE = style("Title", 17, 21, bold=True, align=TA_CENTER)
SUBTITLE = style("Subtitle", 9.2, 12.5, italic=True, align=TA_CENTER)
AUTHOR = style("Author", 8.5, 11.5, align=TA_CENTER)
HEAD = style("Head", 10.2, 13, bold=True, align=TA_LEFT, before=2.5 * mm, after=1.1 * mm)
BODY = style("Body", 8.55, 12.3)
ABSTRACT = style("Abstract", 8.45, 12, italic=True)
REFHEAD = style("RefHead", 8.5, 10.5, bold=True, align=TA_LEFT)
REF = style("Ref", 6.35, 8.2, align=TA_LEFT)
FOOT = style("Foot", 6.7, 8.5, align=TA_LEFT)


REFERENCES = [
    "Webern, Anton. <i>Fünf Stücke für Orchester, op. 10</i>. Vienna: Universal Edition, UE 5067/12416, 1923.",
    "Webern, Anton. <i>Der Weg zur neuen Musik</i>. Edited by Willi Reich. Vienna: Universal Edition, 1960.",
    "Reutter, Hans Peter. “Anton Webern (1883-1945) - Fünf Stücke für Orchester op. 10 (1911-13) - Freie Atonalität, Reduktion auf aphoristische Gesten.” <i>Wege durch das frühe 20. Jahrhundert</i>. n.d.",
    "Kholopova, Valentina, and Yuri Kholopov. <i>Anton Webern: Zhizn' i tvorchestvo</i>. Moscow: Sovetskii kompozitor, 1984.",
    "Zeller, Matthew. “Klangfarbenmelodie in 1911: Timbre's Functional Roles in Webern's Opp. 9 and 10.” <i>Music Theory Online</i> 28, no. 1 (2022). https://doi.org/10.30535/mto.28.1.9.",
    "Anton Webern Gesamtausgabe. “Overview.” https://anton-webern.ch/en/anton-webern/overview.html (accessed 15 July 2026).",
    "Library of Congress. “Anton Webern: Letters and Correspondence.” https://guides.loc.gov/anton-webern/correspondence (accessed 15 July 2026).",
]


PAGES = [
    {
        "language": "English",
        "title": "Computational Modeling of Webern's Op. 10",
        "subtitle": "A research-informed generative score environment for Max/MSP and bach",
        "abstract_h": "Abstract",
        "abstract": (
            "The present project investigates how analytical propositions concerning Anton Webern's "
            "<i>Five Pieces for Orchestra, op. 10</i> may be translated into an explicit and testable "
            "generative system. A Max/MSP patch creates a new twelve-tone pitch field, organizes it "
            "into short instrumental phrases, and produces a ten-staff <i>bach.score</i> with dynamics, "
            "articulation, technique, tempo inflection, and MusicXML export."
        ),
        "method_h": "Research method",
        "method": (
            "The model separates score-observable evidence, analytical interpretation, and numerical "
            "heuristic. Webern's score supplies the ensemble, registers, temporal proportions, and "
            "performance vocabulary. Reutter supports central-tone trajectories, displaced symmetries, "
            "three-note cells, and instrumental correspondences. Kholopova and Kholopov situate these "
            "features within Webern's compressed form and conception of musical time. Webern's lectures "
            "provide the categories of <i>Faßlichkeit</i>, <i>Zusammenhang</i>, and <i>Gliederung</i>. "
            "Zeller's study informs the codependence of timbre, pitch, register, articulation, and dynamics."
        ),
        "model_h": "Computational realization",
        "model": (
            "The displayed row is literally realized by the first twelve sounding events. Subsequent "
            "events use movement-specific transformations, central fields, phrase-level rhythmic cells, "
            "temporary instrumental focus, family grouping, and Klangfarbenmelodie. Instrument ranges "
            "are divided into ordinary and outer bands; monophonic parts are checked over complete "
            "durations. Activity and Dynamics curves define temporal density and the global dynamic form. "
            "Short hairpins, global tempo objects, sparse German character words, phrase metadata, and "
            "idiomatic techniques complete the notation."
        ),
        "result_h": "Research output",
        "result": (
            "Version 6 comprises six differentiated profiles, a reproducible Max patch, a built-in "
            "audition synthesizer, MusicXML slur postprocessing, generative invariants tested outside Max, "
            "and parallel analytical documentation in English, German, and Russian."
        ),
        "refs": "References",
    },
    {
        "language": "Deutsch",
        "title": "Computergestützte Modellierung von Weberns op. 10",
        "subtitle": "Eine forschungsbasierte generative Partiturumgebung für Max/MSP und bach",
        "abstract_h": "Zusammenfassung",
        "abstract": (
            "Das Projekt untersucht, wie analytische Aussagen zu Anton Weberns <i>Fünf Stücken für "
            "Orchester op. 10</i> in ein explizites und überprüfbares generatives System übertragen werden "
            "können. Ein Max/MSP-Patch erzeugt ein neues zwölftöniges Feld, gliedert es in kurze "
            "Instrumentalphrasen und erstellt eine zehnstimmige <i>bach.score</i>-Partitur mit Dynamik, "
            "Artikulation, Spieltechnik, Tempomodifikation und MusicXML-Export."
        ),
        "method_h": "Forschungsmethode",
        "method": (
            "Das Modell trennt unmittelbar beobachtbare Partiturbefunde, analytische Deutungen und "
            "numerische Heuristiken. Weberns Partitur liefert Besetzung, Register, Zeitproportionen und "
            "Aufführungsvokabular. Reutter begründet Zentraltonverläufe, verschobene Symmetrien, "
            "Dreitonzellen und instrumentale Korrespondenzen. Kholopova und Kholopov ordnen diese "
            "Merkmale Weberns Formverdichtung und musikalischer Zeit zu. Die Vorträge liefern "
            "<i>Faßlichkeit</i>, <i>Zusammenhang</i> und <i>Gliederung</i>; Zeller begründet das "
            "Zusammenwirken von Klangfarbe, Tonhöhe, Register, Artikulation und Dynamik."
        ),
        "model_h": "Computergestützte Realisierung",
        "model": (
            "Die sichtbare Reihe erklingt wörtlich in den ersten zwölf Ereignissen. Danach wirken "
            "satzspezifische Transformationen, Zentralfelder, Rhythmuszellen der Mikro-Phrasen, "
            "temporärer Instrumentalfokus, Familiengruppierung und Klangfarbenmelodie. Instrumentbereiche "
            "sind in normale und äußere Lagen geteilt; einstimmige Partien werden über vollständige "
            "Dauern geprüft. Activity und Dynamics bestimmen Ereignisdichte und globale Dynamik. Kurze "
            "Gabeln, globale Tempoobjekte, sparsame deutsche Charakterwörter, Phrasenmetadaten und "
            "instrumentengerechte Techniken vervollständigen die Notation."
        ),
        "result_h": "Forschungsergebnis",
        "result": (
            "Version 6 umfasst sechs differenzierte Profile, einen reproduzierbaren Max-Patch, einen "
            "internen Abhörsynthesizer, MusicXML-Bogenbearbeitung, außerhalb von Max geprüfte "
            "Invarianten und parallele Dokumentation auf Englisch, Deutsch und Russisch."
        ),
        "refs": "Literatur",
    },
    {
        "language": "Русский",
        "title": "Компьютерное моделирование op. 10 Веберна",
        "subtitle": "Исследовательская генеративная среда для Max/MSP и bach",
        "abstract_h": "Аннотация",
        "abstract": (
            "В проекте исследуется перевод аналитических положений о <i>Пяти пьесах для оркестра op. "
            "10</i> Антона Веберна в явную и проверяемую генеративную систему. Патч Max/MSP создаёт "
            "новое двенадцатитоновое поле, членит его на краткие инструментальные фразы и формирует "
            "десятистрочную партитуру <i>bach.score</i> с динамикой, артикуляцией, исполнительскими "
            "приёмами, темповыми отклонениями и экспортом MusicXML."
        ),
        "method_h": "Метод исследования",
        "method": (
            "В модели разграничены непосредственно наблюдаемые факты партитуры, аналитические "
            "интерпретации и числовые эвристики. Партитура Веберна определяет состав, регистры, "
            "временные пропорции и исполнительский словарь. Ройтер обосновывает центральные тоны, "
            "смещённые симметрии, трёхзвучные ячейки и инструментальные соответствия. Холопова и "
            "Холопов связывают эти свойства со сжатием формы и музыкальным временем Веберна. Лекции "
            "вводят категории <i>Faßlichkeit</i>, <i>Zusammenhang</i> и <i>Gliederung</i>; исследование "
            "Зеллера обосновывает взаимосвязь тембра, высоты, регистра, артикуляции и динамики."
        ),
        "model_h": "Компьютерная реализация",
        "model": (
            "Показанный ряд буквально звучит в первых двенадцати событиях. Далее действуют профильные "
            "преобразования, центральные поля, ритмические ячейки микро-фраз, временный тембровый "
            "фокус, группировка семейств и Klangfarbenmelodie. Диапазоны разделены на обычную и "
            "внешнюю зоны; одноголосные партии проверяются по полным длительностям. Кривые Activity и "
            "Dynamics задают плотность и глобальную динамическую форму. Короткие вилочки, глобальные "
            "объекты темпа, редкие немецкие обозначения характера, фразовые метаданные и идиоматические "
            "приёмы завершают нотную запись."
        ),
        "result_h": "Результат исследования",
        "result": (
            "Версия 6 включает шесть различных профилей, воспроизводимый Max-патч, встроенный "
            "синтезатор для прослушивания, обработку лиг MusicXML, тестируемые вне Max инварианты и "
            "параллельную документацию на английском, немецком и русском языках."
        ),
        "refs": "Литература и источники",
    },
]


def draw_paragraph(c, text, paragraph_style, y, width=WIDTH, x=LEFT):
    paragraph = Paragraph(text, paragraph_style)
    _, height = paragraph.wrap(width, H)
    paragraph.drawOn(c, x, y - height)
    return y - height


def draw_page(c, data, number):
    y = H - 20 * mm
    y = draw_paragraph(c, data["title"], TITLE, y)
    y -= 1.5 * mm
    y = draw_paragraph(c, data["subtitle"], SUBTITLE, y)
    y -= 2.3 * mm
    y = draw_paragraph(c, "Dmitrii Shchukin · 2026", AUTHOR, y)
    y -= 4 * mm
    c.setStrokeColorRGB(0, 0, 0)
    c.setLineWidth(0.55)
    c.line(LEFT, y, W - RIGHT, y)
    y -= 5 * mm

    for heading_key, body_key, body_style in [
        ("abstract_h", "abstract", ABSTRACT),
        ("method_h", "method", BODY),
        ("model_h", "model", BODY),
        ("result_h", "result", BODY),
    ]:
        y = draw_paragraph(c, data[heading_key], HEAD, y)
        y -= 0.8 * mm
        y = draw_paragraph(c, data[body_key], body_style, y)
        y -= 1.5 * mm

    reference_top = 67 * mm
    if y < reference_top + 3 * mm:
        raise RuntimeError(f"Page {number} body overlaps bibliography")
    c.line(LEFT, reference_top + 5 * mm, W - RIGHT, reference_top + 5 * mm)
    ref_y = reference_top + 1.5 * mm
    ref_y = draw_paragraph(c, data["refs"], REFHEAD, ref_y)
    ref_y -= 1.2 * mm
    for entry in REFERENCES:
        ref_y = draw_paragraph(c, "• " + entry, REF, ref_y)
        ref_y -= 0.55 * mm

    footer = f"(c) Dmitrii Shchukin 2026    ·    {data['language']}    ·    {number} / 3"
    draw_paragraph(c, footer, FOOT, 13 * mm, x=LEFT)
    c.showPage()


def main():
    OUT.parent.mkdir(parents=True, exist_ok=True)
    c = canvas.Canvas(
        str(OUT),
        pagesize=A4,
        pageCompression=1,
        title="Computational Modeling of Webern's Op. 10",
        author="Dmitrii Shchukin",
        subject="Research project description in English, German, and Russian",
    )
    c.setTitle("Computational Modeling of Webern's Op. 10")
    c.setAuthor("Dmitrii Shchukin")
    c.setCreator("Dmitrii Shchukin")
    c.setSubject("Research project description in English, German, and Russian")
    for number, data in enumerate(PAGES, start=1):
        draw_page(c, data, number)
    c.save()
    print(OUT)


if __name__ == "__main__":
    main()
