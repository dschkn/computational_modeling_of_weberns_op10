{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 5,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      120,
      120,
      690,
      430
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15,
      15
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "righttoolbarpinned": 0,
    "bottomtoolbarpinned": 0,
    "toolbars_unpinned_last_save": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0,
    "description": "Internal audition voice for WebernPersona · (c) Dmitrii Shchukin 2026",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "boxes": [
      {
        "box": {
          "id": "voice-in",
          "maxclass": "newobj",
          "text": "in 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            36,
            38,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-unpack",
          "maxclass": "newobj",
          "text": "unpack f i f",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "float",
            "int",
            "float"
          ],
          "patching_rect": [
            36,
            82,
            88,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-pitch-trigger",
          "maxclass": "newobj",
          "text": "t b f",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            36,
            126,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-cents-midi",
          "maxclass": "newobj",
          "text": "/ 100.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            92,
            126,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-mtof",
          "maxclass": "newobj",
          "text": "mtof",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            92,
            160,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-osc",
          "maxclass": "newobj",
          "text": "cycle~ 440",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            92,
            198,
            68,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-velocity",
          "maxclass": "newobj",
          "text": "/ 127.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            190,
            126,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-velocity-signal",
          "maxclass": "newobj",
          "text": "sig~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            190,
            160,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-duration",
          "maxclass": "newobj",
          "text": "clip 40. 12000.",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            270,
            126,
            96,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-delay",
          "maxclass": "newobj",
          "text": "delay 500",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            270,
            160,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-gate-on",
          "maxclass": "message",
          "text": "1.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            36,
            160,
            30,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-gate-off",
          "maxclass": "message",
          "text": "0.",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            270,
            198,
            30,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-envelope",
          "maxclass": "newobj",
          "text": "adsr~ 8. 35. 0.7 120.",
          "numinlets": 5,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "signal",
            "",
            ""
          ],
          "patching_rect": [
            205,
            238,
            132,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-amp-envelope",
          "maxclass": "newobj",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            92,
            272,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-amp-velocity",
          "maxclass": "newobj",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            92,
            306,
            35,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-level",
          "maxclass": "newobj",
          "text": "*~ 0.16",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            92,
            340,
            55,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-out",
          "maxclass": "newobj",
          "text": "out~ 1",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            92,
            378,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-thispoly",
          "maxclass": "newobj",
          "text": "thispoly~",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "int"
          ],
          "patching_rect": [
            410,
            272,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "voice-loadmute",
          "maxclass": "newobj",
          "text": "loadmess mute 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            410,
            238,
            102,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "voice-in",
            0
          ],
          "destination": [
            "voice-unpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-unpack",
            2
          ],
          "destination": [
            "voice-duration",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-duration",
            0
          ],
          "destination": [
            "voice-delay",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-unpack",
            1
          ],
          "destination": [
            "voice-velocity",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-velocity",
            0
          ],
          "destination": [
            "voice-velocity-signal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-unpack",
            0
          ],
          "destination": [
            "voice-pitch-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-pitch-trigger",
            1
          ],
          "destination": [
            "voice-cents-midi",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-cents-midi",
            0
          ],
          "destination": [
            "voice-mtof",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-mtof",
            0
          ],
          "destination": [
            "voice-osc",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-pitch-trigger",
            0
          ],
          "destination": [
            "voice-gate-on",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "voice-pitch-trigger",
            0
          ],
          "destination": [
            "voice-delay",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "voice-gate-on",
            0
          ],
          "destination": [
            "voice-envelope",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-delay",
            0
          ],
          "destination": [
            "voice-gate-off",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-gate-off",
            0
          ],
          "destination": [
            "voice-envelope",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-osc",
            0
          ],
          "destination": [
            "voice-amp-envelope",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-envelope",
            0
          ],
          "destination": [
            "voice-amp-envelope",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-amp-envelope",
            0
          ],
          "destination": [
            "voice-amp-velocity",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-velocity-signal",
            0
          ],
          "destination": [
            "voice-amp-velocity",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-amp-velocity",
            0
          ],
          "destination": [
            "voice-level",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-level",
            0
          ],
          "destination": [
            "voice-out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-loadmute",
            0
          ],
          "destination": [
            "voice-thispoly",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "voice-envelope",
            2
          ],
          "destination": [
            "voice-thispoly",
            0
          ]
        }
      }
    ],
    "bgcolor": [
      0.12,
      0.13,
      0.15,
      1
    ]
  }
}
