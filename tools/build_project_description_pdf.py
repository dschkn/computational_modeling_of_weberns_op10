#!/usr/bin/env python3

from pathlib import Path

from reportlab.lib.colors import HexColor
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import Paragraph, SimpleDocTemplate, Spacer, Table, TableStyle, PageBreak


ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "docs" / "PROJECT_DESCRIPTION_EN_DE_RU.pdf"
FONT = "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
FONT_BOLD = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"

pdfmetrics.registerFont(TTFont("DejaVu", FONT))
pdfmetrics.registerFont(TTFont("DejaVu-Bold", FONT_BOLD))

INK = HexColor("#1B2430")
BLUE = HexColor("#315B76")
AMBER = HexColor("#A7652B")
PALE = HexColor("#EEF2F4")
MUTED = HexColor("#5B6570")


def pstyle(name, size, leading, color=INK, bold=False, space_after=0):
    return ParagraphStyle(
        name,
        fontName="DejaVu-Bold" if bold else "DejaVu",
        fontSize=size,
        leading=leading,
        textColor=color,
        alignment=TA_LEFT,
        spaceAfter=space_after,
    )


TITLE = pstyle("Title", 22, 27, INK, True, 4 * mm)
KICKER = pstyle("Kicker", 9, 12, AMBER, True, 1.5 * mm)
HEAD = pstyle("Head", 11.5, 15, BLUE, True, 2 * mm)
BODY = pstyle("Body", 9.4, 13.4, INK, False, 2.4 * mm)
SMALL = pstyle("Small", 7.3, 10, MUTED, False, 0)
CALLOUT = pstyle("Callout", 9.2, 13.2, INK, False, 0)


PAGES = [
    {
        "lang": "ENGLISH",
        "title": "Computational Modeling of Webern’s Op. 10",
        "lead": "A research-informed generative score environment for Max/MSP and bach",
        "what_h": "What the project does",
        "what": (
            "The patch generates a fresh twelve-tone pitch collection, turns it into short motives and breathing instrumental gestures, "
            "and builds a ten-staff <i>bach.score</i> for the ensemble world of Anton Webern’s <i>Five Pieces for Orchestra, op. 10</i>. "
            "The result includes register-aware orchestration, rests, dynamics, short hairpins, tempo inflections, articulations and instrument-specific techniques, and can be exported to MusicXML."
        ),
        "method_h": "Model, not imitation",
        "method": (
            "The system does not claim to reconstruct Webern as a historical person. It models traceable preferences: compact motivic groups; displaced symmetry; central tones without functional tonality; "
            "temporary foreground instruments; exchanges among related colours; brief family blocks within Klangfarbenmelodie; resonant tremolo fields; and sharply differentiated formal profiles for all five movements. "
            "Global activity and dynamics curves remain editable by the user."
        ),
        "grammar_h": "Performance and notation grammar",
        "grammar": (
            "Playability is enforced before notation: winds remain monophonic; mutes, flutter tongue, pizzicato, arco and col legno are restricted to suitable instruments; technique and articulation persist across sections instead of changing on every note. "
            "Agogic words such as <i>zögernd</i>, <i>drängend</i> and <i>a tempo</i> are score-level directions. Multi-note phrase boundaries are retained for a standards-compliant MusicXML slur pass."
        ),
        "callout": "Purpose: an explainable composition instrument — not a style-transfer black box, and not a substitute for reading Webern’s scores.",
    },
    {
        "lang": "DEUTSCH",
        "title": "Computergestützte Modellierung von Weberns op. 10",
        "lead": "Eine forschungsbasierte generative Partiturumgebung für Max/MSP und bach",
        "what_h": "Gegenstand des Projekts",
        "what": (
            "Der Patch erzeugt ein neues zwölftöniges Tonhöhenfeld, formt daraus kurze Motive und atmende instrumentale Gesten und erstellt eine zehnstimmige <i>bach.score</i>-Partitur im Ensembleklang von Anton Weberns <i>Fünf Stücken für Orchester op. 10</i>. "
            "Das Ergebnis umfasst registerbewusste Instrumentation, Pausen, Dynamik, kurze Dynamikgabeln, Tempomodifikationen, Artikulation und instrumentengerechte Spieltechniken und lässt sich als MusicXML exportieren."
        ),
        "method_h": "Modell statt Imitation",
        "method": (
            "Das System beansprucht keine Rekonstruktion der historischen Person Webern. Es modelliert nachvollziehbare Präferenzen: knappe motivische Gruppen, verschobene Symmetrien, Zentraltöne ohne funktionale Tonalität, "
            "vorübergehende Vordergrundinstrumente, Übergaben zwischen verwandten Farben, kurze Familienblöcke innerhalb der Klangfarbenmelodie, resonante Tremolofelder und deutlich verschiedene Formprofile der fünf Stücke. "
            "Die globalen Aktivitäts- und Dynamikkurven bleiben frei editierbar."
        ),
        "grammar_h": "Aufführungs- und Notationsgrammatik",
        "grammar": (
            "Die Spielbarkeit wird vor der Notation geprüft: Bläser bleiben einstimmig; Dämpfer, Flatterzunge, pizzicato, arco und col legno erscheinen nur bei geeigneten Instrumenten; Technik und Artikulation gelten abschnittsweise statt für jeden Ton neu. "
            "Agogische Angaben wie <i>zögernd</i>, <i>drängend</i> und <i>a tempo</i> werden global gesetzt. Mehrtönige Phrasengrenzen bleiben für standardkonforme MusicXML-Phrasierungsbögen erhalten."
        ),
        "callout": "Ziel: ein erklärbares Kompositionsinstrument — keine undurchsichtige Stilübertragung und kein Ersatz für die Lektüre von Weberns Partituren.",
    },
    {
        "lang": "РУССКИЙ",
        "title": "Компьютерное моделирование op. 10 Веберна",
        "lead": "Исследовательски обоснованная генеративная среда для Max/MSP и bach",
        "what_h": "Что делает проект",
        "what": (
            "Патч создаёт новый двенадцатитоновый звуковой материал, преобразует его в короткие мотивы и «дышащие» инструментальные жесты и строит десятистрочную партитуру <i>bach.score</i> для ансамблевого мира <i>Пяти пьес для оркестра op. 10</i> Антона Веберна. "
            "Результат включает оркестровку с учётом регистров, паузы, динамику, короткие вилочки, агогику, штрихи и идиоматические приёмы; партитура экспортируется в MusicXML."
        ),
        "method_h": "Модель, а не имитация",
        "method": (
            "Система не претендует на реконструкцию исторической личности Веберна. Она моделирует проверяемые предпочтения: компактные мотивные группы, смещённую симметрию, центральные тоны без функциональной тональности, "
            "временный инструментальный фокус, передачу идеи между родственными тембрами, краткие группировки семейств внутри Klangfarbenmelodie, резонансные поля тремоло и отчётливо разные формальные профили пяти пьес. "
            "Пользователь сохраняет контроль над глобальными кривыми активности и динамики."
        ),
        "grammar_h": "Исполнительская и нотационная грамматика",
        "grammar": (
            "Исполнимость проверяется до записи: духовые остаются одноголосными; сурдина, Flatterzunge, pizzicato, arco и col legno назначаются только подходящим инструментам; техника и штрих сохраняются на протяжении раздела, а не меняются на каждой ноте. "
            "Обозначения <i>zögernd</i>, <i>drängend</i> и <i>a tempo</i> задаются на уровне всей партитуры. Границы многозвучных фраз сохраняются для стандартного преобразования в лиги MusicXML."
        ),
        "callout": "Цель: объяснимый композиторский инструмент — не «чёрный ящик» переноса стиля и не замена чтению партитур Веберна.",
    },
]


def footer(canvas, doc):
    canvas.saveState()
    canvas.setStrokeColor(HexColor("#C9D0D5"))
    canvas.line(22 * mm, 17 * mm, 188 * mm, 17 * mm)
    canvas.setFont("DejaVu", 6.8)
    canvas.setFillColor(MUTED)
    canvas.drawString(22 * mm, 11.5 * mm, "Sources: Webern op. 10 score; Webern, Der Weg zur neuen Musik; Reutter; Kholopova & Kholopov; Zeller; Cook/Stadlen.")
    canvas.drawRightString(188 * mm, 11.5 * mm, f"{doc.page} / 3")
    canvas.restoreState()


def make_page(data):
    story = [
        Paragraph(data["lang"], KICKER),
        Paragraph(data["title"], TITLE),
        Paragraph(data["lead"], pstyle("Lead" + data["lang"], 11.2, 16, BLUE, False, 7 * mm)),
        Paragraph(data["what_h"], HEAD),
        Paragraph(data["what"], BODY),
        Spacer(1, 2 * mm),
        Paragraph(data["method_h"], HEAD),
        Paragraph(data["method"], BODY),
        Spacer(1, 2 * mm),
        Paragraph(data["grammar_h"], HEAD),
        Paragraph(data["grammar"], BODY),
        Spacer(1, 7 * mm),
    ]
    callout = Table([[Paragraph(data["callout"], CALLOUT)]], colWidths=[164 * mm])
    callout.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), PALE),
        ("BOX", (0, 0), (-1, -1), 0.7, HexColor("#BFCBD2")),
        ("LEFTPADDING", (0, 0), (-1, -1), 6 * mm),
        ("RIGHTPADDING", (0, 0), (-1, -1), 6 * mm),
        ("TOPPADDING", (0, 0), (-1, -1), 4 * mm),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 4 * mm),
    ]))
    story.append(callout)
    return story


def main():
    OUT.parent.mkdir(parents=True, exist_ok=True)
    doc = SimpleDocTemplate(
        str(OUT), pagesize=A4,
        leftMargin=22 * mm, rightMargin=22 * mm,
        topMargin=20 * mm, bottomMargin=23 * mm,
        title="Computational Modeling of Webern's Op. 10 - Project Description",
        author="dschkn",
    )
    story = []
    for index, page in enumerate(PAGES):
        if index:
            story.append(PageBreak())
        story.extend(make_page(page))
    doc.build(story, onFirstPage=footer, onLaterPages=footer)
    print(OUT)


if __name__ == "__main__":
    main()
