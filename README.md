# Computational Modeling of Webern's Op. 10

Copyright (c) Dmitrii Shchukin 2026

This research software generates a ten-staff `bach.score` in Max/MSP from a
new twelve-tone pitch row and a transparent set of analytical constraints. Its
principal reference is Anton Webern's *Five Pieces for Orchestra*, op. 10; the
model also draws on Webern's lectures, Hans Peter Reutter's analysis, the
monograph by Valentina Kholopova and Yuri Kholopov, and recent scholarship on
Klangfarbenmelodie.


## Scope

The generator coordinates pitch, instrumental register, micro-phrase,
rhythmic cell, temporary timbral focus, dynamics, articulation, playing
technique, tempo inflection, and short local hairpins. The six profiles comprise
one op. 10 synthesis and five differentiated movement models. The displayed
row is the first aggregate realized in the score.

The project is an analytical composition instrument, not a claim to reproduce
the historical person Anton Webern.

## Requirements and use

- Max 8.6 or later;
- `bach` 0.8.2 or later.

Open `max/WebernPersona.maxpat`, choose a profile and parameters, edit the
Activity/Time and Dynamics/Time curves, and select **Generate Material** or
**Build Score**. Every Build operation captures the current curves and produces
a fresh realization. **Play** uses the bundled MSP audition voice; **Export
XML** writes MusicXML.

For standard multi-note phrase slurs after export:

```sh
node tools/add_phrase_slurs.js exported.musicxml
```

## Repository

- `max/` - the main patch, the compositional engine, the audition voice, and
  movement profiles;
- `research/notes/{english,deutsch,russian}/` - parallel analytical notes;
- `research/score/` and `research/texts/` - local research sources when their
  redistribution status permits inclusion;
- `docs/` - architecture, runtime checklist, and the trilingual project paper;
- `tools/` and `tests/` - reproducible build and validation utilities.

Run the complete static and generative test suite with:

```sh
node tools/validate.js
```

## Citation and licence

Authorship and intellectual-property rights in the software, original model,
and project documentation belong to Dmitrii Shchukin. The work is made
available under the MIT License; third-party scores and publications retain
their respective rights. Bibliographic metadata is provided in `CITATION.cff`.
