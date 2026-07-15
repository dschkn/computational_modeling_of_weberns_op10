# Analytical Model: From Webern's Op. 10 to a Generative System

Copyright (c) Dmitrii Shchukin 2026

## Aim and historical position

The aim of the present study is to formulate a testable computational model of
relations observed in Anton Webern's *Five Pieces for Orchestra*, op. 10. The
cycle belongs to Webern's freely atonal, aphoristic period and predates his
strict twelve-tone practice. The generated row is consequently a user-defined
control of the chromatic field, not a historical attribution of serial method
to op. 10.

The model distinguishes three epistemic levels: a documented fact is directly
visible in the score or stated in a source; an inference interprets a recurrent
relation; a heuristic is a numerical choice introduced for generation and
subject to later corpus measurement.

## Musical thought, coherence, and articulation

Webern identifies intelligibility and internal connection as general
conditions of musical presentation: “Die Faßlichkeit ist überhaupt das
oberste Gesetz” and “Es muß ein Zusammenhang da sein” (Webern 1960, 45).
Earlier in the lectures he relates intelligibility to *Gliederung*, the
division of a thought into perceptible sections (Webern 1960, 18). These
statements motivate a model based on related micro-phrases rather than an
undifferentiated succession of isolated notes.

## Pitch organization

Each realization begins with a newly selected permutation of the twelve pitch
classes. The first twelve sounding events present that row literally; later
cycles may use inversion, retrograde, retrograde inversion, transposition,
central pitch fields, or a movement-specific pedal. Candidate rows receive
higher scores for interval-class diversity, for the coexistence of semitone or
whole-tone motion with wider dissonant intervals, and for varied three-note
partitions.

Reutter's analysis of movement I supports a profile in which B/H is established
at the opening, A-flat/G-sharp acts as a displaced centre, and F closes the
piece. The algorithm retains this directed field without treating it as
functional tonality. The closing pitch and selected formal axes are therefore
profile constraints; the intervening row remains newly generated.

## Form, time, and micro-phrase

Events are grouped into phrases of two to six notes. A phrase may sustain one
instrumental foreground, exchange a cell between related colours, produce an
echo, form a brief homorhythmic block, or create a staggered tremolo field.
Duration is selected from non-repeating group-level rhythmic cells. Activity
controls density and inter-onset distance, whereas Silence increases the breath
between groups. The five movement profiles define different temporal
silhouettes rather than variations of a single probability table.

## Timbre and register

Instrument selection combines recent-colour memory, family affinity, formal
role, register, and timbral contrast. Short woodwind, brass, keyboard/harp, or
string groupings preserve a residual ensemble syntax; a subsequent change of
family restores Klangfarbenmelodie. Zeller's analysis is decisive here because
it treats timbre, pitch, register, articulation, and dynamics as interdependent
formal parameters rather than independent decoration (Zeller 2022).

Every instrument has a physical range and a narrower ordinary range. Quiet
events are strongly weighted toward the ordinary range; outer registers are
reserved for an axis, climax, or specifically profiled colour. Monophonic
instruments are checked over complete sounding intervals after event placement,
so two notes cannot overlap merely because their attacks differ.

## Dynamics, tempo, and agency

The user-drawn Dynamics curve is a global form: horizontal position denotes
time and vertical position maps directly from `pppp` to `fff`. Local breath may
modify intermediate notes without replacing the curve. Hairpins remain inside
one short phrase. Tempo words and tempo objects belong to the whole score.

Six higher-level controls expose the heuristic agent: Coherence,
Metamorphosis, Timbral Contrast, Symmetry, Silence, and Lyrical Breath. They do
not select fixed templates; they alter the weighting of traceable decisions.
The engine's `trace` command reports the formal role and reason for every
instrument choice.

## References

- Reutter, Hans Peter. “Anton Webern (1883-1945) - Fünf Stücke für Orchester
  op. 10 (1911-13) - Freie Atonalität, Reduktion auf aphoristische Gesten.”
  *Wege durch das frühe 20. Jahrhundert*. n.d.
- Webern, Anton. *Der Weg zur neuen Musik*. Edited by Willi Reich. Vienna:
  Universal Edition, 1960.
- Zeller, Matthew. “Klangfarbenmelodie in 1911: Timbre's Functional Roles in
  Webern's Opp. 9 and 10.” *Music Theory Online* 28, no. 1 (2022).
  https://doi.org/10.30535/mto.28.1.9.

