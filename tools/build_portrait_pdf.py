#!/usr/bin/env python3
"""Build the two-page Russian Webern Persona research portrait."""

from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    KeepTogether,
    PageBreak,
    Paragraph,
    SimpleDocTemplate,
    Spacer,
    Table,
    TableStyle,
)


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "docs" / "WEBERN_PERSONA_PORTRAIT_RU.pdf"

INK = colors.HexColor("#17202B")
MUTED = colors.HexColor("#586573")
PAPER = colors.HexColor("#F6F2E9")
PANEL = colors.HexColor("#ECE6D9")
AMBER = colors.HexColor("#C56E25")
BLUE = colors.HexColor("#2E728E")
WHITE = colors.white


def register_fonts():
    pdfmetrics.registerFont(TTFont("DejaVu", "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"))
    pdfmetrics.registerFont(TTFont("DejaVu-Bold", "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"))


register_fonts()
styles = getSampleStyleSheet()

BODY = ParagraphStyle(
    "BodyRU", parent=styles["BodyText"], fontName="DejaVu", fontSize=8.8,
    leading=12.1, textColor=INK, spaceAfter=5, alignment=TA_LEFT,
)
SMALL = ParagraphStyle(
    "SmallRU", parent=BODY, fontSize=7.1, leading=9.2, textColor=MUTED, spaceAfter=2,
)
H1 = ParagraphStyle(
    "H1RU", parent=BODY, fontName="DejaVu-Bold", fontSize=22, leading=25,
    textColor=INK, spaceAfter=6,
)
H2 = ParagraphStyle(
    "H2RU", parent=BODY, fontName="DejaVu-Bold", fontSize=12.5, leading=15,
    textColor=BLUE, spaceBefore=2, spaceAfter=6,
)
H3 = ParagraphStyle(
    "H3RU", parent=BODY, fontName="DejaVu-Bold", fontSize=9.3, leading=11,
    textColor=AMBER, spaceAfter=3,
)
CONTROL = ParagraphStyle(
    "ControlRU", parent=BODY, fontName="DejaVu-Bold", fontSize=8.1,
    leading=9.2, textColor=AMBER, spaceAfter=0,
)
LABEL = ParagraphStyle(
    "LabelRU", parent=BODY, fontName="DejaVu-Bold", fontSize=6.8, leading=8,
    textColor=BLUE, tracking=1.2, spaceAfter=6,
)
QUOTE = ParagraphStyle(
    "QuoteRU", parent=BODY, fontName="DejaVu-Bold", fontSize=11.5, leading=15,
    textColor=WHITE, leftIndent=3 * mm, rightIndent=3 * mm,
)
TABLE_HEAD = ParagraphStyle(
    "TableHeadRU", parent=SMALL, fontName="DejaVu-Bold", fontSize=7.2,
    textColor=WHITE, leading=8.6,
)
TABLE_BODY = ParagraphStyle(
    "TableBodyRU", parent=SMALL, fontSize=6.9, leading=8.8, textColor=INK,
)


def p(text, style=BODY):
    return Paragraph(text, style)


def tension(number, title, text):
    badge = Table(
        [[p(str(number), ParagraphStyle(
            f"badge{number}", parent=BODY, fontName="DejaVu-Bold", fontSize=10,
            leading=12, textColor=WHITE, alignment=1,
        ))]],
        colWidths=[8 * mm], rowHeights=[8 * mm],
    )
    badge.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), BLUE),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("BOX", (0, 0), (-1, -1), 0, BLUE),
    ]))
    text_block = [p(title, H3), p(text, BODY)]
    row = Table([[badge, text_block]], colWidths=[11 * mm, 70 * mm])
    row.setStyle(TableStyle([
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (-1, -1), 0),
        ("RIGHTPADDING", (0, 0), (-1, -1), 3),
        ("TOPPADDING", (0, 0), (-1, -1), 1),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
    ]))
    return row


def page_background(canvas, doc):
    width, height = A4
    canvas.saveState()
    canvas.setFillColor(PAPER)
    canvas.rect(0, 0, width, height, stroke=0, fill=1)
    canvas.setFillColor(AMBER)
    canvas.rect(0, height - 5 * mm, width, 5 * mm, stroke=0, fill=1)
    canvas.setFont("DejaVu-Bold", 6.5)
    canvas.setFillColor(MUTED)
    canvas.drawString(18 * mm, 10 * mm, "WEBERN PERSONA / RESEARCH-INFORMED GENERATOR")
    canvas.drawRightString(width - 18 * mm, 10 * mm, f"{doc.page} / 2")
    canvas.restoreState()


def build_story():
    story = []
    story += [
        p("ИССЛЕДОВАТЕЛЬСКИЙ ПОРТРЕТ · 15 ИЮЛЯ 2026", LABEL),
        p("Антон Веберн:<br/>портрет принимающего решения", H1),
        p(
            "Не цифровая маска и не набор поверхностных клише, а рабочая модель того, "
            "как музыкальная мысль становится необходимой. Веберн здесь — композитор, "
            "который ищет максимум связности при минимуме материала, слышит тембр как "
            "структуру и проверяет каждый жест на право остаться.",
            BODY,
        ),
        Spacer(1, 3 * mm),
    ]

    quote = Table([[p("«В этой реальности — все чудеса».  Письмо Альбану Бергу, 1919", QUOTE)]],
                  colWidths=[174 * mm])
    quote.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), INK),
        ("LEFTPADDING", (0, 0), (-1, -1), 8),
        ("RIGHTPADDING", (0, 0), (-1, -1), 8),
        ("TOPPADDING", (0, 0), (-1, -1), 8),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 8),
    ]))
    story += [quote, Spacer(1, 5 * mm), p("ШЕСТЬ НАПРЯЖЕНИЙ ЕГО МЫШЛЕНИЯ", H2)]

    left = [
        tension(1, "Закон и переживание", "Музыка рождается из внутреннего опыта, но не остаётся исповедью: чувство должно обнаружить собственный закон и ясную форму."),
        tension(2, "Природа и конструкция", "Цветок интересует его одновременно ароматом, формой и принципом роста. Отсюда образ Urpflanze: одна идея узнаваема во всех превращениях."),
        tension(3, "Краткость и насыщенность", "Афоризм заканчивается не потому, что мысль мала, а потому, что процесс исчерпан. Повтор без новой функции становится излишеством."),
    ]
    right = [
        tension(4, "Точка и мотив", "Отдельный звук и даже пауза получают самостоятельность, но точка не теряет принадлежности к группе, жесту и более крупной смысловой связи."),
        tension(5, "Цвет и постижимость", "Тембр не орнаментирует готовую высоту. Он сегментирует форму, создаёт foreground/background, связывает далёкие события и способен имитировать иной тембр."),
        tension(6, "Строгость и свобода", "Ограничение освобождает выбор: двенадцатитоновое поле, симметрия или ряд уменьшают произвол, оставляя свободу регистру, ритму и краске."),
    ]
    columns = Table([[left, right]], colWidths=[85 * mm, 85 * mm], hAlign="LEFT")
    columns.setStyle(TableStyle([
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (0, -1), 0),
        ("RIGHTPADDING", (0, 0), (0, -1), 5),
        ("LEFTPADDING", (1, 0), (1, -1), 5),
        ("RIGHTPADDING", (1, 0), (1, -1), 0),
        ("LINEBEFORE", (1, 0), (1, -1), 0.5, colors.HexColor("#C9C2B4")),
    ]))
    story += [columns, Spacer(1, 3 * mm)]

    note = Table([[p(
        "Из писем 1911–1913 годов видно, что смены красок и способы звукоизвлечения "
        "были для Веберна сознательным предметом композиции. Но письма не дают готовой "
        "таблицы вероятностей: конкретное решение приходится реконструировать по функции "
        "в партитуре, эскизам и аналитическим соответствиям.", SMALL)]], colWidths=[174 * mm])
    note.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), PANEL),
        ("BOX", (0, 0), (-1, -1), 0.5, colors.HexColor("#D2C8B8")),
        ("LEFTPADDING", (0, 0), (-1, -1), 8),
        ("RIGHTPADDING", (0, 0), (-1, -1), 8),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
    ]))
    story += [note, PageBreak()]

    story += [
        p("ОТ ПОРТРЕТА К ПРАВИЛАМ", LABEL),
        p("Почему после флейты появляется альт?", H1),
        p(
            "Никакой один фактор не отвечает на этот вопрос. Движок сначала определяет "
            "функцию события, затем оценивает десять инструментов и лишь после этого "
            "выбирает кандидата. Важна не частота пары сама по себе, а причина перехода.", BODY,
        ),
        Spacer(1, 2 * mm),
    ]

    flow = Table([[p("ИДЕЯ", TABLE_HEAD), p("ФУНКЦИЯ", TABLE_HEAD), p("КАНДИДАТЫ", TABLE_HEAD), p("ЛАСТИК", TABLE_HEAD)]],
                 colWidths=[43.5 * mm] * 4)
    flow.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), BLUE),
        ("ALIGN", (0, 0), (-1, -1), "CENTER"),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("LEFTPADDING", (0, 0), (-1, -1), 6),
        ("RIGHTPADDING", (0, 0), (-1, -1), 6),
        ("TOPPADDING", (0, 0), (-1, -1), 7),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 7),
        ("LINEBEFORE", (1, 0), (-1, -1), 0.6, colors.HexColor("#73A3B7")),
    ]))
    story += [flow, Spacer(1, 4 * mm)]

    rows = [
        ["Формальная роль", "Ось, фон, эхо, педаль, временный foreground", "У оси op. 10/I резко возрастает вес трубы и тромбона."],
        ["Тембровое родство", "Сходство атаки, резонанса, артикуляции", "Флейта + трель челесты может предвосхитить flatterzunge."],
        ["Полихромный контраст", "Смена семейства без случайного калейдоскопа", "Флейта → альт разделяет планы, если мотивная связь сохранена."],
        ["Память", "Фокус держит микро-фразу; смена краски требует функции", "Инструмент может сыграть 2–5 нот, затем передать жест родственному тембру."],
        ["Метаморфоза", "Зеркальный партнёр получает родственный тембр/регистр", "Возврат узнаваем, но не является механической копией."],
        ["Исполнимость", "Комфортный регистр, длительность, динамика и атака", "Крайний регистр допускается как вершина, но штрафуется как фон."],
    ]
    table_data = [[p("ФАКТОР", TABLE_HEAD), p("ЧТО ПРОВЕРЯЕТСЯ", TABLE_HEAD), p("ПРИМЕР РЕШЕНИЯ", TABLE_HEAD)]]
    table_data += [[p(a, TABLE_BODY), p(b, TABLE_BODY), p(c, TABLE_BODY)] for a, b, c in rows]
    decision_table = Table(table_data, colWidths=[35 * mm, 56 * mm, 83 * mm], repeatRows=1)
    decision_table.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), INK),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [WHITE, PANEL]),
        ("GRID", (0, 0), (-1, -1), 0.35, colors.HexColor("#C9C2B4")),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("LEFTPADDING", (0, 0), (-1, -1), 5),
        ("RIGHTPADDING", (0, 0), (-1, -1), 5),
        ("TOPPADDING", (0, 0), (-1, -1), 5),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
    ]))
    story += [decision_table, Spacer(1, 4 * mm), p("ШЕСТЬ РЕГУЛЯТОРОВ PERSONA", H2)]

    control_data = [
        [p("Coherence", CONTROL), p("мотивная память", SMALL), p("Metamorphosis", CONTROL), p("изменённый возврат", SMALL), p("Timbral contrast", CONTROL), p("разделение красок", SMALL)],
        [p("Symmetry", CONTROL), p("смещённая ось", SMALL), p("Silence", CONTROL), p("пауза как единица", SMALL), p("Lyrical breath", CONTROL), p("динамическое дыхание", SMALL)],
    ]
    controls = Table(control_data, colWidths=[36 * mm, 22 * mm] * 3)
    controls.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), PANEL),
        ("BOX", (0, 0), (-1, -1), 0.5, colors.HexColor("#C9C2B4")),
        ("INNERGRID", (0, 0), (-1, -1), 0.3, colors.HexColor("#D8D0C4")),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("LEFTPADDING", (0, 0), (-1, -1), 4),
        ("RIGHTPADDING", (0, 0), (-1, -1), 4),
        ("TOPPADDING", (0, 0), (-1, -1), 4),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 4),
    ]))
    story += [controls, Spacer(1, 3 * mm)]

    boundary = Table([[p(
        "ГРАНИЦА МОДЕЛИ. Генератор реконструирует ограничения и способы связи, "
        "но не сознание, веру, травму или художественное право исторического человека. "
        "Корректное название результата: Webern-informed score.", SMALL)]], colWidths=[174 * mm])
    boundary.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, -1), colors.HexColor("#F1DCC8")),
        ("BOX", (0, 0), (-1, -1), 0.6, AMBER),
        ("LEFTPADDING", (0, 0), (-1, -1), 7),
        ("RIGHTPADDING", (0, 0), (-1, -1), 7),
        ("TOPPADDING", (0, 0), (-1, -1), 5),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
    ]))
    story += [boundary, Spacer(1, 3 * mm), p("ИСТОЧНИКИ И СТАТУС ДОКАЗАТЕЛЬНОСТИ", H2)]

    sources = (
        "[1] А. Веберн, <i>Der Weg zur neuen Musik</i>, с. 10–11, 18–19, 54–60.  "
        "[2] В. Холопова, Ю. Холопов, <i>Антон Веберн</i>, с. 13–14, 234–267.  "
        "[3] H. P. Reutter, анализ op. 10 (полная и краткая версии).  "
        "[4] M. Zeller, <link href='https://mtosmt.org/issues/mto.22.28.1/mto.22.28.1.zeller.html' color='#2E728E'>Klangfarbenmelodie in 1911</link>, MTO 28/1 (2022).  "
        "[5] J. Ballance, <link href='https://ceur-ws.org/Vol-2723/short5.pdf' color='#2E728E'>Pitch-Class Distributions</link> (2020).  "
        "[6] <link href='https://anton-webern.ch/en/anton-webern/letters.html' color='#2E728E'>Anton Webern Gesamtausgabe: Letters</link>; "
        "<link href='https://www.paul-sacher-stiftung.ch/en/archive/u-z/webern-en-230202.html' color='#2E728E'>Paul Sacher Stiftung</link>.  "
        "Наблюдаемое в партитуре помечается documented; аналитический перенос — inferred; числовой вес без корпусной оценки — heuristic."
    )
    story += [p(sources, SMALL)]
    return story


def main():
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    doc = SimpleDocTemplate(
        str(OUTPUT), pagesize=A4,
        rightMargin=18 * mm, leftMargin=18 * mm,
        topMargin=17 * mm, bottomMargin=17 * mm,
        title="Антон Веберн: портрет принимающего решения",
        author="Webern Persona Score project",
        subject="Research-informed composer portrait and algorithmic decision model",
    )
    doc.build(build_story(), onFirstPage=page_background, onLaterPages=page_background)
    print(OUTPUT)


if __name__ == "__main__":
    main()
