# Performance Grammar and Vocabulary

Copyright (c) Dmitrii Shchukin 2026

## Principle

Performance notation is generated as sectional grammar. Articulation,
technique, expression, dynamics, and register must jointly clarify a phrase;
they are not independently randomized for every note. Local text is sparse,
and a state remains active until a meaningful change or cancellation.

## Expression fields

- Quiet or withdrawing: *äußerst zart*, *mit zartestem Ausdruck*, *innig*,
  *wie ein Hauch*, *kaum hörbar*, *verhalten*, *schwebend*, *verklingend*.
- Lyrical: *ausdrucksvoll*, *mit Ausdruck*, *espressivo*, *dolce*,
  *dolcissimo*, *gesangvoll*, *warm*, *sehr gebunden*.
- Mobile: *leicht*, *flüchtig*, *frei im Vortrag*, *lebendig*, *deutlich*,
  *hervortretend*, *etwas belebter*, *parlando*, *zart bewegt*.
- Forceful: *kräftig*, *sehr bestimmt*, *scharf*, *heftig bewegt*, *markiert*,
  *mit Nachdruck*.

Terms are selected according to formal role, family, activity, and local
dynamic trajectory. A word is not reused until the relevant local pool has
been exhausted.

## Instrumental capability matrix

| Technique | Eligible instruments |
|---|---|
| *mit Dämpfer / Dämpfer ab* | trumpet, trombone, violin, viola, violoncello |
| *Flatterzunge* | flute, clarinet, trumpet |
| *pizz. / arco / col legno* | violin, viola, violoncello |
| *mit Schwammschlägel* | glockenspiel |
| tremolo or trill pedal | profile-dependent keyboards, harp, glockenspiel, strings |

Flute, clarinet, trumpet, trombone, and glockenspiel remain monophonic. A
duration-closure pass prevents overlaps even when two attacks are separately
quantized.

## Articulation and slur

Legato, portato, detached, accented, and tremolo states are chosen per section
and family. A phrase may receive one slur over two to six notes, while another
voice remains staccato or accented. The patch stores phrase boundaries in slot
25; `tools/add_phrase_slurs.js` converts them to standard MusicXML slurs after
export.

## Dynamics and engraving density

Dynamic marks are key points, not labels on every note. A crescendo or
diminuendo wedge may span only adjacent points in one micro-phrase and is
limited to a few quarter-note beats. Character text, technique changes, and
dynamic marks are suppressed when their simultaneous placement would obscure
the notation.

