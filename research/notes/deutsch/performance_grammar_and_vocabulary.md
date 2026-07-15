# Aufführungsgrammatik und Wortschatz

Copyright (c) Dmitrii Shchukin 2026

## Prinzip

Die Aufführungsnotation wird als abschnittsbezogene Grammatik erzeugt.
Artikulation, Spieltechnik, Ausdruck, Dynamik und Register sollen gemeinsam
eine Phrase gliedern und werden nicht Ton für Ton unabhängig ausgelost. Lokale
Texte bleiben sparsam; ein Zustand gilt bis zu einem begründeten Wechsel oder
seiner Aufhebung.

## Ausdrucksfelder

- Ruhig oder zurücktretend: *äußerst zart*, *mit zartestem Ausdruck*, *innig*,
  *wie ein Hauch*, *kaum hörbar*, *verhalten*, *schwebend*, *verklingend*.
- Lyrisch: *ausdrucksvoll*, *mit Ausdruck*, *espressivo*, *dolce*,
  *dolcissimo*, *gesangvoll*, *warm*, *sehr gebunden*.
- Beweglich: *leicht*, *flüchtig*, *frei im Vortrag*, *lebendig*, *deutlich*,
  *hervortretend*, *etwas belebter*, *parlando*, *zart bewegt*.
- Nachdrücklich: *kräftig*, *sehr bestimmt*, *scharf*, *heftig bewegt*,
  *markiert*, *mit Nachdruck*.

Die Auswahl folgt Formfunktion, Instrumentenfamilie, Aktivität und lokaler
Dynamik. Ein Wort wird erst wiederholt, wenn der betreffende lokale Vorrat
ausgeschöpft ist.

## Instrumentale Möglichkeiten

| Technik | Zulässige Instrumente |
|---|---|
| *mit Dämpfer / Dämpfer ab* | Trompete, Posaune, Violine, Viola, Violoncello |
| *Flatterzunge* | Flöte, Klarinette, Trompete |
| *pizz. / arco / col legno* | Violine, Viola, Violoncello |
| *mit Schwammschlägel* | Glockenspiel |
| Tremolo- oder Trillerpedal | profilabhängig Tasteninstrumente, Harfe, Glockenspiel, Streicher |

Flöte, Klarinette, Trompete, Posaune und Glockenspiel bleiben einstimmig. Ein
abschließender Dauerntest verhindert Überschneidungen auch bei getrennt
quantisierten Einsätzen.

## Artikulation, Bogen und Dynamik

Legato, Portato, abgesetzte, akzentuierte und Tremolo-Zustände gelten pro
Abschnitt und Familie. Ein Bogen kann zwei bis sechs Töne einer Phrase
verbinden, während eine andere Stimme staccato bleibt. Slot 25 bewahrt die
Grenzen; `tools/add_phrase_slurs.js` schreibt MusicXML-Bögen.

Dynamikzeichen markieren Schlüsselpunkte. Eine Gabel verbindet nur benachbarte
Punkte derselben Mikro-Phrase und bleibt auf wenige Viertelschläge begrenzt.
Text, Technikwechsel und Dynamik werden ausgedünnt, wenn ihre Gleichzeitigkeit
die Lesbarkeit beeinträchtigen würde.

