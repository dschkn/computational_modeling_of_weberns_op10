# System Architecture / Systemarchitektur / Архитектура системы

Copyright (c) Dmitrii Shchukin 2026

## English

### Generative pipeline

The system separates musical decisions from notation. `webernPersonaEngine.js`
generates a literal first aggregate, phrase groups, instrument assignments,
registers, durations, dynamics, and performance states. A hidden `bach.roll`
receives the events; `bach.quantize` constructs rhythmic notation; `bach.score`
receives the native llll and is subsequently decorated through linked slots.

`Generate Material` advances the seeded random sequence and replaces the row
and event field. `Build Score` first reads both user-drawn curves, then performs
a fresh generation, quantization, and decoration. The visible row therefore
describes the first twelve pitch classes of the current score.

### Musical invariants

Instrument choice is conditioned by family, temporary focus, formal role,
recent-colour memory, range, and movement profile. Group-level rhythmic cells
cannot repeat in adjacent phrases. Pedal groups in movement III are staggered
and limited to three carriers. Monophonic instruments are checked for attack
collisions and duration overlaps. Local hairpins cannot leave a micro-phrase;
tempo directions belong to the score.

### Playback and export

Outlet 7 of `bach.score` feeds `bach.playkeys cents velocity duration`, after
which the three values are joined and sent to `poly~ WebernVoice`. The Play
button starts DSP before playback. MusicXML export includes annotation slots 24
and 25; the postprocessor converts phrase metadata into standard slur elements.

## Deutsch

### Generative Verarbeitung

Das System trennt musikalische Entscheidungen von der Notation.
`webernPersonaEngine.js` erzeugt das wörtliche erste Aggregat, Phrasengruppen,
Instrumente, Register, Dauern, Dynamik und Aufführungszustände. Ein verborgenes
`bach.roll` empfängt die Ereignisse, `bach.quantize` erstellt die rhythmische
Notation und `bach.score` erhält das native llll sowie die anschließenden
Slot-Dekorationen.

`Generate Material` setzt die initialisierte Zufallsfolge fort und ersetzt
Reihe und Ereignisfeld. `Build Score` liest zunächst beide gezeichneten Kurven
und führt danach Generierung, Quantisierung und Dekoration neu aus. Die sichtbare
Reihe entspricht den ersten zwölf Tonklassen der aktuellen Partitur.

### Musikalische Invarianten

Instrumentwahl hängt von Familie, temporärem Fokus, Formfunktion,
Farbgedächtnis, Register und Satzprofil ab. Benachbarte Phrasen wiederholen
keine Rhythmuszelle. Pedalgruppen in Satz III sind versetzt und auf drei Träger
begrenzt. Einstimmige Instrumente werden auf Einsatz- und Dauerkollisionen
geprüft. Lokale Gabeln verlassen keine Mikro-Phrase; Tempoangaben gelten global.

### Wiedergabe und Export

Ausgang 7 von `bach.score` führt zu `bach.playkeys cents velocity duration`;
die Werte werden verbunden und an `poly~ WebernVoice` geschickt. Play startet
zuerst DSP. Der MusicXML-Export enthält die Slots 24 und 25; die Nachbearbeitung
wandelt Phrasenmetadaten in standardisierte Bögen um.

## Русский

### Генеративный тракт

Система разделяет музыкальные решения и нотную запись.
`webernPersonaEngine.js` создаёт буквальный первый агрегат, фразовые группы,
инструментовку, регистры, длительности, динамику и исполнительские состояния.
Скрытый `bach.roll` принимает события, `bach.quantize` формирует ритмическую
запись, а `bach.score` получает нативный llll и последующее оформление через
связанные слоты.

`Generate Material` продолжает инициализированную случайную последовательность
и заменяет ряд и события. `Build Score` сначала считывает обе нарисованные
кривые, после чего заново выполняет генерацию, квантование и оформление.
Отображаемый ряд соответствует первым двенадцати классам высот партитуры.

### Музыкальные инварианты

Выбор инструмента зависит от семейства, временного фокуса, формальной роли,
памяти тембров, регистра и профиля пьесы. Соседние фразы не повторяют
ритмическую ячейку. Педальные группы III рассинхронизированы и ограничены тремя
носителями. Одноголосные инструменты проверяются на совпадения атак и
пересечения длительностей. Локальная вилочка не выходит за пределы
микро-фразы; темповые обозначения относятся ко всей партитуре.

### Воспроизведение и экспорт

Выход 7 `bach.score` направлен в `bach.playkeys cents velocity duration`, после
чего три значения объединяются и поступают в `poly~ WebernVoice`. Кнопка Play
включает DSP до запуска партитуры. Экспорт MusicXML включает слоты 24 и 25;
постпроцессор преобразует фразовые метаданные в стандартные лиги.

