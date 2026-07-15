# Max Runtime Checklist / Max-Laufzeitprüfung / Проверка в Max

Copyright (c) Dmitrii Shchukin 2026

## English

1. Open `max/WebernPersona.maxpat` in Presentation Mode. Confirm that every
   menu, number box, curve, and button remains clickable and that panels stay
   behind the controls.
2. Select each profile. Confirm that BPM and both default curves change.
3. Select Generate Material twice. Confirm that the row changes; re-enter the
   original Seed and confirm that the first result returns.
4. Select Build Score repeatedly. Confirm a new score after every selection and
   confirm that edited Activity and Dynamics curves affect the result.
5. Compare the displayed row with the first twelve pitch classes. Confirm that
   wind and glockenspiel parts contain no chords or overlapping tied notes.
6. Inspect movement III. No pedal group should contain more than three
   simultaneous carriers; attacks should be staggered.
7. Select Play. DSP should switch on and the internal sine-based reference
   synthesis should sound without an external MIDI device. Stop must halt the
   score cursor and note stream.
8. Verify readable spacing for all ten staves in the enlarged score viewport.
9. Export MusicXML and run `node tools/add_phrase_slurs.js FILE.musicxml`.

## Deutsch

1. `max/WebernPersona.maxpat` im Präsentationsmodus öffnen. Menü, Zahlenfelder,
   Kurven und Tasten müssen anklickbar bleiben; Panels liegen im Hintergrund.
2. Jedes Profil anwählen und Änderungen von BPM und beiden Ausgangskurven
   prüfen.
3. Generate Material zweimal auslösen; die Reihe muss wechseln. Nach erneuter
   Eingabe des Seed muss das erste Ergebnis wiederkehren.
4. Build Score wiederholt auslösen. Jede Betätigung erzeugt eine neue Partitur
   und berücksichtigt geänderte Activity- und Dynamics-Kurven.
5. Sichtbare Reihe und erste zwölf Tonklassen vergleichen. Bläser und
   Glockenspiel dürfen keine Akkorde oder überlappenden Bindungen enthalten.
6. Satz III prüfen: höchstens drei versetzte Pedalträger pro Gruppe.
7. Play betätigen. DSP startet, und die interne Sinus-Referenzsynthese klingt
   ohne externes MIDI-Gerät. Stop beendet Cursor und Notenstrom.
8. Lesbarkeit aller zehn Systeme im vergrößerten Partiturausschnitt prüfen.
9. MusicXML exportieren und `node tools/add_phrase_slurs.js FILE.musicxml`
   ausführen.

## Русский

1. Открыть `max/WebernPersona.maxpat` в режиме Presentation. Проверить
   доступность меню, числовых полей, кривых и кнопок; панели должны оставаться
   на заднем плане.
2. Выбрать каждый профиль и проверить изменение BPM и обеих исходных кривых.
3. Дважды нажать Generate Material: ряд должен измениться. Повторный ввод Seed
   должен вернуть первый результат.
4. Несколько раз нажать Build Score. Каждое нажатие создаёт новую партитуру и
   учитывает изменения Activity и Dynamics.
5. Сопоставить показанный ряд с первыми двенадцатью классами высот. У духовых и
   глокеншпиля не допускаются аккорды и перекрывающиеся залигованные ноты.
6. Проверить III: не более трёх смещённых носителей педали в одной группе.
7. Нажать Play. DSP должен включиться, а встроенный синусоидальный
   референс-синтез — звучать без внешнего MIDI-устройства. Stop останавливает
   курсор и поток нот.
8. Проверить читаемость десяти станов в увеличенном окне партитуры.
9. Экспортировать MusicXML и выполнить
   `node tools/add_phrase_slurs.js FILE.musicxml`.
