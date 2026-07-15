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
      30,
      45,
      1440,
      1020
    ],
    "bglocked": 0,
    "openinpresentation": 1,
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
    "description": "",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "boxes": [
      {
        "box": {
          "id": "material-panel",
          "maxclass": "panel",
          "mode": 0,
          "angle": 270,
          "bgcolor": [
            0.105,
            0.116,
            0.14,
            1
          ],
          "border": 1,
          "bordercolor": [
            0.21,
            0.23,
            0.28,
            1
          ],
          "rounded": 12,
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            28,
            74,
            405,
            225
          ],
          "presentation": 1,
          "presentation_rect": [
            28,
            74,
            405,
            225
          ]
        }
      },
      {
        "box": {
          "id": "activity-panel",
          "maxclass": "panel",
          "mode": 0,
          "angle": 270,
          "bgcolor": [
            0.105,
            0.116,
            0.14,
            1
          ],
          "border": 1,
          "bordercolor": [
            0.21,
            0.23,
            0.28,
            1
          ],
          "rounded": 12,
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            449,
            74,
            446,
            225
          ],
          "presentation": 1,
          "presentation_rect": [
            449,
            74,
            446,
            225
          ]
        }
      },
      {
        "box": {
          "id": "dynamics-panel",
          "maxclass": "panel",
          "mode": 0,
          "angle": 270,
          "bgcolor": [
            0.105,
            0.116,
            0.14,
            1
          ],
          "border": 1,
          "bordercolor": [
            0.21,
            0.23,
            0.28,
            1
          ],
          "rounded": 12,
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            911,
            74,
            501,
            225
          ],
          "presentation": 1,
          "presentation_rect": [
            911,
            74,
            501,
            225
          ]
        }
      },
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "text": "VON WEBERN",
          "fontsize": 25,
          "fontface": 1,
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            30,
            18,
            260,
            34
          ],
          "presentation": 1,
          "presentation_rect": [
            30,
            18,
            260,
            34
          ]
        }
      },
      {
        "box": {
          "id": "subtitle",
          "maxclass": "comment",
          "text": "research-informed score generator / op. 10",
          "fontsize": 12,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            222,
            29,
            390,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            222,
            29,
            390,
            22
          ]
        }
      },
      {
        "box": {
          "id": "material-title",
          "maxclass": "comment",
          "text": "MATERIAL",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [
            0.91,
            0.61,
            0.24,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            48,
            91,
            130,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            48,
            91,
            130,
            22
          ]
        }
      },
      {
        "box": {
          "id": "activity-title",
          "maxclass": "comment",
          "text": "ACTIVITY / TIME",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [
            0.26,
            0.53,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            469,
            91,
            180,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            469,
            91,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "dynamics-title",
          "maxclass": "comment",
          "text": "DYNAMICS / TIME",
          "fontsize": 14,
          "fontface": 1,
          "textcolor": [
            0.91,
            0.61,
            0.24,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            931,
            91,
            180,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            931,
            91,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-label",
          "maxclass": "comment",
          "text": "Profile",
          "fontsize": 11,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            48,
            126,
            60,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            48,
            126,
            60,
            20
          ]
        }
      },
      {
        "box": {
          "id": "profile-menu",
          "maxclass": "umenu",
          "items": [
            "Op.10 synthesis",
            ",",
            "I - Sehr ruhig und zart",
            ",",
            "II - Lebhaft und zart bewegt",
            ",",
            "III - Sehr langsam und äußerst ruhig",
            ",",
            "IV - Fließend, äußerst zart",
            ",",
            "V - Sehr fließend"
          ],
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "patching_rect": [
            112,
            123,
            297,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            112,
            123,
            297,
            24
          ]
        }
      },
      {
        "box": {
          "id": "seed-number-label",
          "maxclass": "comment",
          "text": "Seed",
          "fontsize": 11,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            48,
            160,
            55,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            48,
            160,
            55,
            20
          ]
        }
      },
      {
        "box": {
          "id": "seed-number",
          "maxclass": "number",
          "minimum": 1,
          "maximum": 2147483646,
          "fontsize": 12,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            104,
            157,
            66,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            104,
            157,
            66,
            24
          ]
        }
      },
      {
        "box": {
          "id": "event-number-label",
          "maxclass": "comment",
          "text": "Events",
          "fontsize": 11,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            183,
            160,
            55,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            183,
            160,
            55,
            20
          ]
        }
      },
      {
        "box": {
          "id": "event-number",
          "maxclass": "number",
          "minimum": 1,
          "maximum": 240,
          "fontsize": 12,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            240,
            157,
            55,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            240,
            157,
            55,
            24
          ]
        }
      },
      {
        "box": {
          "id": "tempo-number-label",
          "maxclass": "comment",
          "text": "BPM",
          "fontsize": 11,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            307,
            160,
            40,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            307,
            160,
            40,
            20
          ]
        }
      },
      {
        "box": {
          "id": "tempo-number",
          "maxclass": "number",
          "minimum": 24,
          "maximum": 180,
          "fontsize": 12,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            349,
            157,
            60,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            349,
            157,
            60,
            24
          ]
        }
      },
      {
        "box": {
          "id": "density-label",
          "maxclass": "comment",
          "text": "Texture density",
          "fontsize": 11,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            48,
            194,
            95,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            48,
            194,
            95,
            20
          ]
        }
      },
      {
        "box": {
          "id": "density-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 12,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            145,
            191,
            60,
            24
          ],
          "presentation": 1,
          "presentation_rect": [
            145,
            191,
            60,
            24
          ]
        }
      },
      {
        "box": {
          "id": "generate-button",
          "maxclass": "textbutton",
          "text": "1  GENERATE MATERIAL",
          "texton": "1  GENERATE MATERIAL",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [
            1,
            1,
            1,
            1
          ],
          "textoncolor": [
            1,
            1,
            1,
            1
          ],
          "bgcolor": [
            0.56,
            0.31,
            0.11,
            1
          ],
          "bgcolor2": [
            0.56,
            0.31,
            0.11,
            1
          ],
          "rounded": 8,
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            48,
            235,
            220,
            42
          ],
          "presentation": 1,
          "presentation_rect": [
            48,
            235,
            220,
            42
          ]
        }
      },
      {
        "box": {
          "id": "build-button",
          "maxclass": "textbutton",
          "text": "2  BUILD SCORE",
          "texton": "2  BUILD SCORE",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [
            1,
            1,
            1,
            1
          ],
          "textoncolor": [
            1,
            1,
            1,
            1
          ],
          "bgcolor": [
            0.19,
            0.4,
            0.53,
            1
          ],
          "bgcolor2": [
            0.19,
            0.4,
            0.53,
            1
          ],
          "rounded": 8,
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            278,
            235,
            131,
            42
          ],
          "presentation": 1,
          "presentation_rect": [
            278,
            235,
            131,
            42
          ]
        }
      },
      {
        "box": {
          "id": "activity-help",
          "maxclass": "comment",
          "text": "low = spacious / high = rapid",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            469,
            118,
            240,
            19
          ],
          "presentation": 1,
          "presentation_rect": [
            469,
            118,
            240,
            19
          ]
        }
      },
      {
        "box": {
          "id": "activity-function",
          "maxclass": "function",
          "addpoints": [
            0,
            0.24,
            0,
            420,
            0.52,
            0,
            720,
            0.38,
            0,
            1000,
            0.2,
            0
          ],
          "classic_curve": 1,
          "bgcolor": [
            0.08,
            0.09,
            0.11,
            1
          ],
          "bordercolor": [
            0.21,
            0.23,
            0.28,
            1
          ],
          "linecolor": [
            0.26,
            0.53,
            0.72,
            1
          ],
          "pointcolor": [
            1,
            1,
            1,
            1
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "",
            "",
            "bang"
          ],
          "patching_rect": [
            469,
            140,
            406,
            118
          ],
          "presentation": 1,
          "presentation_rect": [
            469,
            140,
            406,
            118
          ]
        }
      },
      {
        "box": {
          "id": "activity-axis-left",
          "maxclass": "comment",
          "text": "beginning",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            469,
            265,
            70,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            469,
            265,
            70,
            18
          ]
        }
      },
      {
        "box": {
          "id": "activity-axis-right",
          "maxclass": "comment",
          "text": "ending",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            827,
            265,
            48,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            827,
            265,
            48,
            18
          ]
        }
      },
      {
        "box": {
          "id": "dynamics-help",
          "maxclass": "comment",
          "text": "x = time · y = exact dynamic level",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            931,
            118,
            300,
            19
          ],
          "presentation": 1,
          "presentation_rect": [
            931,
            118,
            300,
            19
          ]
        }
      },
      {
        "box": {
          "id": "dynamics-function",
          "maxclass": "function",
          "addpoints": [
            0,
            0.16,
            0,
            580,
            0.54,
            0,
            780,
            0.36,
            0,
            1000,
            0.18,
            0
          ],
          "classic_curve": 1,
          "bgcolor": [
            0.08,
            0.09,
            0.11,
            1
          ],
          "bordercolor": [
            0.21,
            0.23,
            0.28,
            1
          ],
          "linecolor": [
            0.91,
            0.61,
            0.24,
            1
          ],
          "pointcolor": [
            1,
            1,
            1,
            1
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "float",
            "",
            "",
            "bang"
          ],
          "patching_rect": [
            968,
            140,
            424,
            118
          ],
          "presentation": 1,
          "presentation_rect": [
            968,
            140,
            424,
            118
          ]
        }
      },
      {
        "box": {
          "id": "dyn-y-top",
          "maxclass": "comment",
          "text": "fff",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            936,
            137,
            28,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            936,
            137,
            28,
            18
          ]
        }
      },
      {
        "box": {
          "id": "dyn-y-bottom",
          "maxclass": "comment",
          "text": "pppp",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            932,
            241,
            32,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            932,
            241,
            32,
            18
          ]
        }
      },
      {
        "box": {
          "id": "dyn-x-left",
          "maxclass": "comment",
          "text": "beginning",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            968,
            265,
            70,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            968,
            265,
            70,
            18
          ]
        }
      },
      {
        "box": {
          "id": "dyn-x-right",
          "maxclass": "comment",
          "text": "ending",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1344,
            265,
            48,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            1344,
            265,
            48,
            18
          ]
        }
      },
      {
        "box": {
          "id": "row-label",
          "maxclass": "comment",
          "text": "ROW",
          "fontsize": 11,
          "fontface": 1,
          "textcolor": [
            0.91,
            0.61,
            0.24,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            31,
            311,
            40,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            31,
            311,
            40,
            20
          ]
        }
      },
      {
        "box": {
          "id": "row-display",
          "maxclass": "message",
          "text": "-",
          "fontsize": 12,
          "fontface": 1,
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "bgcolor": [
            0.09,
            0.1,
            0.12,
            1
          ],
          "border": 0,
          "ignoreclick": 1,
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            73,
            307,
            520,
            27
          ],
          "presentation": 1,
          "presentation_rect": [
            73,
            307,
            520,
            27
          ]
        }
      },
      {
        "box": {
          "id": "status-label",
          "maxclass": "comment",
          "text": "STATUS",
          "fontsize": 11,
          "fontface": 1,
          "textcolor": [
            0.26,
            0.53,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            618,
            311,
            54,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            618,
            311,
            54,
            20
          ]
        }
      },
      {
        "box": {
          "id": "status-display",
          "maxclass": "message",
          "text": "ready",
          "fontsize": 11,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "bgcolor": [
            0.09,
            0.1,
            0.12,
            1
          ],
          "border": 0,
          "ignoreclick": 1,
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            675,
            307,
            439,
            27
          ],
          "presentation": 1,
          "presentation_rect": [
            675,
            307,
            439,
            27
          ]
        }
      },
      {
        "box": {
          "id": "clear-button",
          "maxclass": "textbutton",
          "text": "CLEAR",
          "texton": "CLEAR",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [
            1,
            1,
            1,
            1
          ],
          "textoncolor": [
            1,
            1,
            1,
            1
          ],
          "bgcolor": [
            0.64,
            0.25,
            0.25,
            1
          ],
          "bgcolor2": [
            0.64,
            0.25,
            0.25,
            1
          ],
          "rounded": 8,
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1120,
            306,
            70,
            29
          ],
          "presentation": 1,
          "presentation_rect": [
            1120,
            306,
            70,
            29
          ]
        }
      },
      {
        "box": {
          "id": "play-button",
          "maxclass": "textbutton",
          "text": "PLAY",
          "texton": "PLAY",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [
            1,
            1,
            1,
            1
          ],
          "textoncolor": [
            1,
            1,
            1,
            1
          ],
          "bgcolor": [
            0.2,
            0.39,
            0.27,
            1
          ],
          "bgcolor2": [
            0.2,
            0.39,
            0.27,
            1
          ],
          "rounded": 8,
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1198,
            306,
            52,
            29
          ],
          "presentation": 1,
          "presentation_rect": [
            1198,
            306,
            52,
            29
          ]
        }
      },
      {
        "box": {
          "id": "stop-button",
          "maxclass": "textbutton",
          "text": "STOP",
          "texton": "STOP",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [
            1,
            1,
            1,
            1
          ],
          "textoncolor": [
            1,
            1,
            1,
            1
          ],
          "bgcolor": [
            0.28,
            0.29,
            0.32,
            1
          ],
          "bgcolor2": [
            0.28,
            0.29,
            0.32,
            1
          ],
          "rounded": 8,
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1258,
            306,
            52,
            29
          ],
          "presentation": 1,
          "presentation_rect": [
            1258,
            306,
            52,
            29
          ]
        }
      },
      {
        "box": {
          "id": "export-button",
          "maxclass": "textbutton",
          "text": "EXPORT XML",
          "texton": "EXPORT XML",
          "fontsize": 13,
          "fontface": 1,
          "textcolor": [
            1,
            1,
            1,
            1
          ],
          "textoncolor": [
            1,
            1,
            1,
            1
          ],
          "bgcolor": [
            0.56,
            0.31,
            0.11,
            1
          ],
          "bgcolor2": [
            0.56,
            0.31,
            0.11,
            1
          ],
          "rounded": 8,
          "mode": 0,
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1318,
            306,
            94,
            29
          ],
          "presentation": 1,
          "presentation_rect": [
            1318,
            306,
            94,
            29
          ]
        }
      },
      {
        "box": {
          "id": "persona-panel",
          "maxclass": "panel",
          "mode": 0,
          "angle": 270,
          "bgcolor": [
            0.105,
            0.116,
            0.14,
            1
          ],
          "border": 1,
          "bordercolor": [
            0.21,
            0.23,
            0.28,
            1
          ],
          "rounded": 12,
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            28,
            348,
            1384,
            62
          ],
          "presentation": 1,
          "presentation_rect": [
            28,
            348,
            1384,
            62
          ]
        }
      },
      {
        "box": {
          "id": "persona-title",
          "maxclass": "comment",
          "text": "PERSONA / DECISION BIASES",
          "fontsize": 11,
          "fontface": 1,
          "textcolor": [
            0.26,
            0.53,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            45,
            356,
            210,
            20
          ],
          "presentation": 1,
          "presentation_rect": [
            45,
            356,
            210,
            20
          ]
        }
      },
      {
        "box": {
          "id": "persona-help",
          "maxclass": "comment",
          "text": "0–1 · constraints shape choices, never copy a historical person",
          "fontsize": 9,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            45,
            379,
            330,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            45,
            379,
            330,
            18
          ]
        }
      },
      {
        "box": {
          "id": "coherence-number-label",
          "maxclass": "comment",
          "text": "Coherence",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            390,
            356,
            74,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            390,
            356,
            74,
            18
          ]
        }
      },
      {
        "box": {
          "id": "coherence-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            390,
            377,
            64,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            390,
            377,
            64,
            22
          ]
        }
      },
      {
        "box": {
          "id": "metamorphosis-number-label",
          "maxclass": "comment",
          "text": "Metamorphosis",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            480,
            356,
            92,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            480,
            356,
            92,
            18
          ]
        }
      },
      {
        "box": {
          "id": "metamorphosis-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            480,
            377,
            64,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            480,
            377,
            64,
            22
          ]
        }
      },
      {
        "box": {
          "id": "contrast-number-label",
          "maxclass": "comment",
          "text": "Timbral contrast",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            580,
            356,
            104,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            580,
            356,
            104,
            18
          ]
        }
      },
      {
        "box": {
          "id": "contrast-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            580,
            377,
            64,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            580,
            377,
            64,
            22
          ]
        }
      },
      {
        "box": {
          "id": "symmetry-number-label",
          "maxclass": "comment",
          "text": "Symmetry",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            700,
            356,
            70,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            700,
            356,
            70,
            18
          ]
        }
      },
      {
        "box": {
          "id": "symmetry-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            700,
            377,
            64,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            700,
            377,
            64,
            22
          ]
        }
      },
      {
        "box": {
          "id": "silence-number-label",
          "maxclass": "comment",
          "text": "Silence",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            790,
            356,
            54,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            790,
            356,
            54,
            18
          ]
        }
      },
      {
        "box": {
          "id": "silence-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            790,
            377,
            64,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            790,
            377,
            64,
            22
          ]
        }
      },
      {
        "box": {
          "id": "lyricism-number-label",
          "maxclass": "comment",
          "text": "Lyrical breath",
          "fontsize": 10,
          "fontface": 0,
          "textcolor": [
            0.61,
            0.65,
            0.72,
            1
          ],
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            880,
            356,
            90,
            18
          ],
          "presentation": 1,
          "presentation_rect": [
            880,
            356,
            90,
            18
          ]
        }
      },
      {
        "box": {
          "id": "lyricism-number",
          "maxclass": "flonum",
          "minimum": 0,
          "maximum": 1,
          "format": 6,
          "fontsize": 11,
          "bgcolor": [
            0.16,
            0.17,
            0.2,
            1
          ],
          "textcolor": [
            0.93,
            0.94,
            0.96,
            1
          ],
          "triangle": 0,
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            880,
            377,
            64,
            22
          ],
          "presentation": 1,
          "presentation_rect": [
            880,
            377,
            64,
            22
          ]
        }
      },
      {
        "box": {
          "id": "score",
          "maxclass": "bach.score",
          "numinlets": 7,
          "numoutlets": 9,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "bang"
          ],
          "out": "nnnnnnnn",
          "numvoices": 10,
          "autosize": 1,
          "clefs": [
            "G",
            "G",
            "G",
            "F",
            "FG",
            "FG",
            "G",
            "G",
            "Alto",
            "F"
          ],
          "voicenames": [
            "Flute",
            "Clarinet",
            "Trumpet",
            "Trombone",
            "Celesta",
            "Harp",
            "Glockenspiel",
            "Violin",
            "Viola",
            "Violoncello"
          ],
          "midichannels": [
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10
          ],
          "linkdynamicstoslot": 20,
          "linkarticulationstoslot": 22,
          "linkannotationtoslot": 24,
          "thinannotations": 1,
          "annotationfontsize": 9,
          "dynamicsfontsize": 12,
          "voicespacing": [
            18,
            34,
            46,
            34,
            50,
            38,
            38,
            50,
            34,
            34,
            22
          ],
          "vzoom": 100,
          "zoom": 82,
          "legend": 0,
          "bgcolor": [
            0.985,
            0.985,
            0.98,
            1
          ],
          "textcolor": [
            0.08,
            0.08,
            0.08,
            1
          ],
          "staffcolor": [
            0.18,
            0.18,
            0.18,
            1
          ],
          "showfirstmeasurenumber": 0,
          "finitestaff": 1,
          "versionnumber": 80200,
          "patching_rect": [
            28,
            420,
            1384,
            568
          ],
          "presentation": 1,
          "presentation_rect": [
            28,
            420,
            1384,
            568
          ]
        }
      },
      {
        "box": {
          "id": "engine-send",
          "maxclass": "newobj",
          "text": "s #0-webern-engine",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            95,
            1000,
            126,
            22
          ]
        }
      },
      {
        "box": {
          "id": "engine-receive",
          "maxclass": "newobj",
          "text": "r #0-webern-engine",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            260,
            1000,
            126,
            22
          ]
        }
      },
      {
        "box": {
          "id": "core",
          "maxclass": "newobj",
          "text": "p webern.core",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            420,
            1000,
            103,
            22
          ],
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
              80,
              80,
              940,
              560
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
            "description": "",
            "digest": "",
            "tags": "",
            "style": "",
            "subpatcher_template": "",
            "assistshowspatchername": 0,
            "boxes": [
              {
                "box": {
                  "id": "core-in",
                  "index": 1,
                  "maxclass": "inlet",
                  "comment": "engine messages",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    40,
                    50,
                    30,
                    30
                  ]
                }
              },
              {
                "box": {
                  "id": "core-route",
                  "maxclass": "newobj",
                  "text": "route buildscore tempo",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    105,
                    54,
                    151,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-js",
                  "maxclass": "newobj",
                  "text": "js webernPersonaEngine.js",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "outlettype": [
                    "",
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    330,
                    165,
                    164,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-roll",
                  "maxclass": "bach.roll",
                  "numinlets": 6,
                  "numoutlets": 8,
                  "outlettype": [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "bang"
                  ],
                  "numvoices": 10,
                  "clefs": [
                    "G",
                    "G",
                    "G",
                    "F",
                    "FG",
                    "FG",
                    "G",
                    "G",
                    "Alto",
                    "F"
                  ],
                  "voicenames": [
                    "Flute",
                    "Clarinet",
                    "Trumpet",
                    "Trombone",
                    "Celesta",
                    "Harp",
                    "Glockenspiel",
                    "Violin",
                    "Viola",
                    "Violoncello"
                  ],
                  "midichannels": [
                    1,
                    2,
                    3,
                    4,
                    5,
                    6,
                    7,
                    8,
                    9,
                    10
                  ],
                  "autosize": 1,
                  "patching_rect": [
                    330,
                    230,
                    340,
                    150
                  ],
                  "versionnumber": 80200
                }
              },
              {
                "box": {
                  "id": "core-quantize",
                  "maxclass": "newobj",
                  "text": "bach.quantize @minimalunits 1/16 1/12 1/8 @smalleventshandling 0",
                  "numinlets": 3,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    330,
                    420,
                    402,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-build-trigger",
                  "maxclass": "newobj",
                  "text": "t b b b",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    "bang"
                  ],
                  "patching_rect": [
                    105,
                    115,
                    58,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-quantize-status",
                  "maxclass": "message",
                  "text": "quantize_requested",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    105,
                    145,
                    119,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-quantize-message",
                  "maxclass": "message",
                  "text": "quantize",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    175,
                    145,
                    58,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-tempo-store",
                  "maxclass": "newobj",
                  "text": "i 60",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    105,
                    185,
                    36,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-measureinfo",
                  "maxclass": "message",
                  "text": "[4 4] [$1]",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    105,
                    230,
                    72,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-tempo-trigger",
                  "maxclass": "newobj",
                  "text": "t i i",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "int",
                    "int"
                  ],
                  "patching_rect": [
                    225,
                    95,
                    42,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-prepend-tempo",
                  "maxclass": "newobj",
                  "text": "prepend tempo",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    225,
                    130,
                    93,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-score-arrived",
                  "maxclass": "newobj",
                  "text": "t b",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    750,
                    420,
                    30,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-score-status",
                  "maxclass": "message",
                  "text": "score_data_received",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    790,
                    385,
                    126,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-defer",
                  "maxclass": "newobj",
                  "text": "deferlow",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    750,
                    365,
                    55,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-decorate",
                  "maxclass": "message",
                  "text": "decorate",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    750,
                    320,
                    62,
                    22
                  ]
                }
              },
              {
                "box": {
                  "id": "core-score-out",
                  "index": 1,
                  "maxclass": "outlet",
                  "comment": "bach.score data and commands",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    500,
                    500,
                    30,
                    30
                  ]
                }
              },
              {
                "box": {
                  "id": "core-row-out",
                  "index": 2,
                  "maxclass": "outlet",
                  "comment": "row",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    565,
                    500,
                    30,
                    30
                  ]
                }
              },
              {
                "box": {
                  "id": "core-status-out",
                  "index": 3,
                  "maxclass": "outlet",
                  "comment": "status",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    630,
                    500,
                    30,
                    30
                  ]
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "core-in",
                    0
                  ],
                  "destination": [
                    "core-route",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-route",
                    0
                  ],
                  "destination": [
                    "core-build-trigger",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-route",
                    1
                  ],
                  "destination": [
                    "core-tempo-trigger",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-route",
                    2
                  ],
                  "destination": [
                    "core-js",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-tempo-trigger",
                    1
                  ],
                  "destination": [
                    "core-tempo-store",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-tempo-trigger",
                    0
                  ],
                  "destination": [
                    "core-prepend-tempo",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-prepend-tempo",
                    0
                  ],
                  "destination": [
                    "core-js",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-build-trigger",
                    2
                  ],
                  "destination": [
                    "core-quantize-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-quantize-status",
                    0
                  ],
                  "destination": [
                    "core-status-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-build-trigger",
                    1
                  ],
                  "destination": [
                    "core-quantize-message",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-quantize-message",
                    0
                  ],
                  "destination": [
                    "core-roll",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-build-trigger",
                    0
                  ],
                  "destination": [
                    "core-tempo-store",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-tempo-store",
                    0
                  ],
                  "destination": [
                    "core-measureinfo",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-measureinfo",
                    0
                  ],
                  "destination": [
                    "core-quantize",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-js",
                    0
                  ],
                  "destination": [
                    "core-roll",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-roll",
                    0
                  ],
                  "destination": [
                    "core-quantize",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-quantize",
                    0
                  ],
                  "destination": [
                    "core-score-out",
                    0
                  ],
                  "order": 0
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-quantize",
                    0
                  ],
                  "destination": [
                    "core-score-arrived",
                    0
                  ],
                  "order": 1
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-score-arrived",
                    0
                  ],
                  "destination": [
                    "core-score-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-score-status",
                    0
                  ],
                  "destination": [
                    "core-status-out",
                    0
                  ],
                  "order": 0
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-score-arrived",
                    0
                  ],
                  "destination": [
                    "core-defer",
                    0
                  ],
                  "order": 1
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-defer",
                    0
                  ],
                  "destination": [
                    "core-decorate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-decorate",
                    0
                  ],
                  "destination": [
                    "core-js",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-js",
                    1
                  ],
                  "destination": [
                    "core-row-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-js",
                    2
                  ],
                  "destination": [
                    "core-status-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "core-js",
                    3
                  ],
                  "destination": [
                    "core-score-out",
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
      },
      {
        "box": {
          "id": "profile-prepend",
          "maxclass": "newobj",
          "text": "prepend profile",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            95,
            1045,
            96,
            22
          ]
        }
      },
      {
        "box": {
          "id": "seed-prepend",
          "maxclass": "newobj",
          "text": "prepend seed",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            205,
            1045,
            88,
            22
          ]
        }
      },
      {
        "box": {
          "id": "events-prepend",
          "maxclass": "newobj",
          "text": "prepend eventcount",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            307,
            1045,
            121,
            22
          ]
        }
      },
      {
        "box": {
          "id": "tempo-prepend",
          "maxclass": "newobj",
          "text": "prepend tempo",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            442,
            1045,
            93,
            22
          ]
        }
      },
      {
        "box": {
          "id": "density-prepend",
          "maxclass": "newobj",
          "text": "prepend density",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            549,
            1045,
            102,
            22
          ]
        }
      },
      {
        "box": {
          "id": "activity-prepend",
          "maxclass": "newobj",
          "text": "prepend activity",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            665,
            1045,
            104,
            22
          ]
        }
      },
      {
        "box": {
          "id": "dynamics-prepend",
          "maxclass": "newobj",
          "text": "prepend dynamics",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            783,
            1045,
            113,
            22
          ]
        }
      },
      {
        "box": {
          "id": "coherence-prepend",
          "maxclass": "newobj",
          "text": "prepend coherence",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            95,
            1080,
            125,
            22
          ]
        }
      },
      {
        "box": {
          "id": "metamorphosis-prepend",
          "maxclass": "newobj",
          "text": "prepend metamorphosis",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            235,
            1080,
            144,
            22
          ]
        }
      },
      {
        "box": {
          "id": "contrast-prepend",
          "maxclass": "newobj",
          "text": "prepend timbralcontrast",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            394,
            1080,
            151,
            22
          ]
        }
      },
      {
        "box": {
          "id": "symmetry-prepend",
          "maxclass": "newobj",
          "text": "prepend symmetry",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            560,
            1080,
            116,
            22
          ]
        }
      },
      {
        "box": {
          "id": "silence-prepend",
          "maxclass": "newobj",
          "text": "prepend silence",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            691,
            1080,
            106,
            22
          ]
        }
      },
      {
        "box": {
          "id": "lyricism-prepend",
          "maxclass": "newobj",
          "text": "prepend lyricism",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            812,
            1080,
            116,
            22
          ]
        }
      },
      {
        "box": {
          "id": "generate-trigger",
          "maxclass": "newobj",
          "text": "t b b b",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            "bang"
          ],
          "patching_rect": [
            930,
            1045,
            59,
            22
          ]
        }
      },
      {
        "box": {
          "id": "build-refresh-trigger",
          "maxclass": "newobj",
          "text": "t b b b b",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "bang",
            "bang",
            "bang",
            "bang"
          ],
          "patching_rect": [
            930,
            1080,
            70,
            22
          ]
        }
      },
      {
        "box": {
          "id": "activity-listdump",
          "maxclass": "message",
          "text": "listdump",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1004,
            1027,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "dynamics-listdump",
          "maxclass": "message",
          "text": "listdump",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1004,
            1062,
            58,
            22
          ]
        }
      },
      {
        "box": {
          "id": "generate-message",
          "maxclass": "message",
          "text": "generate",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1077,
            1045,
            62,
            22
          ]
        }
      },
      {
        "box": {
          "id": "build-message",
          "maxclass": "message",
          "text": "buildscore",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1153,
            1045,
            70,
            22
          ]
        }
      },
      {
        "box": {
          "id": "clear-message",
          "maxclass": "message",
          "text": "clear",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1237,
            1045,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "play-message",
          "maxclass": "message",
          "text": "play",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1289,
            1045,
            34,
            22
          ]
        }
      },
      {
        "box": {
          "id": "stop-message",
          "maxclass": "message",
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1337,
            1045,
            34,
            22
          ]
        }
      },
      {
        "box": {
          "id": "export-message",
          "maxclass": "message",
          "text": "exportxml @directionslots 24 25 @exportmarkers 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1335,
            1045,
            235,
            22
          ]
        }
      },
      {
        "box": {
          "id": "row-set",
          "maxclass": "newobj",
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            555,
            1000,
            81,
            22
          ]
        }
      },
      {
        "box": {
          "id": "status-set",
          "maxclass": "newobj",
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            655,
            1000,
            81,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-trigger",
          "maxclass": "newobj",
          "text": "t i i",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "int"
          ],
          "patching_rect": [
            95,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-select",
          "maxclass": "newobj",
          "text": "sel 0 1 2 3 4 5",
          "numinlets": 1,
          "numoutlets": 7,
          "outlettype": [
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            ""
          ],
          "patching_rect": [
            150,
            1185,
            118,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-tempo-0",
          "maxclass": "message",
          "text": "60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            285,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-activity-0",
          "maxclass": "message",
          "text": "clear, 0 0.28, 420 0.48, 700 0.34, 1000 0.22",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            285,
            1217,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-dynamics-0",
          "maxclass": "message",
          "text": "clear, 0 0.18, 550 0.46, 760 0.34, 1000 0.2",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            285,
            1249,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-tempo-1",
          "maxclass": "message",
          "text": "50",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            475,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-activity-1",
          "maxclass": "message",
          "text": "clear, 0 0.2, 440 0.48, 630 0.42, 1000 0.12",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            475,
            1217,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-dynamics-1",
          "maxclass": "message",
          "text": "clear, 0 0.08, 500 0.25, 1000 0.1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            475,
            1249,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-tempo-2",
          "maxclass": "message",
          "text": "100",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            665,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-activity-2",
          "maxclass": "message",
          "text": "clear, 0 0.46, 350 0.58, 720 0.7, 1000 0.94",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            665,
            1217,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-dynamics-2",
          "maxclass": "message",
          "text": "clear, 0 0.18, 500 0.46, 820 0.78, 1000 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            665,
            1249,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-tempo-3",
          "maxclass": "message",
          "text": "40",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            855,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-activity-3",
          "maxclass": "message",
          "text": "clear, 0 0.12, 480 0.2, 720 0.3, 1000 0.12",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            855,
            1217,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-dynamics-3",
          "maxclass": "message",
          "text": "clear, 0 0.06, 580 0.3, 780 0.42, 1000 0.1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            855,
            1249,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-tempo-4",
          "maxclass": "message",
          "text": "60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1045,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-activity-4",
          "maxclass": "message",
          "text": "clear, 0 0.32, 460 0.48, 720 0.28, 1000 0.12",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1045,
            1217,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-dynamics-4",
          "maxclass": "message",
          "text": "clear, 0 0.1, 520 0.3, 1000 0.08",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1045,
            1249,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-tempo-5",
          "maxclass": "message",
          "text": "152",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1235,
            1185,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-activity-5",
          "maxclass": "message",
          "text": "clear, 0 0.62, 480 0.8, 620 1, 760 0.3, 1000 0.08",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1235,
            1217,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "profile-dynamics-5",
          "maxclass": "message",
          "text": "clear, 0 0.34, 500 0.72, 620 1, 800 0.16, 1000 0.04",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1235,
            1249,
            180,
            22
          ]
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "text": "loadbang",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            95,
            1140,
            59,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-trigger",
          "maxclass": "newobj",
          "text": "t b b b b b b b b b b b b",
          "numinlets": 1,
          "numoutlets": 12,
          "outlettype": [
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang",
            "bang"
          ],
          "patching_rect": [
            170,
            1140,
            196,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-profile",
          "maxclass": "message",
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380,
            1140,
            30,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-seed",
          "maxclass": "message",
          "text": "1913",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            420,
            1140,
            42,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-events",
          "maxclass": "message",
          "text": "25",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            472,
            1140,
            30,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-tempo",
          "maxclass": "message",
          "text": "60",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            512,
            1140,
            30,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-density",
          "maxclass": "message",
          "text": "0.45",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            552,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-coherence",
          "maxclass": "message",
          "text": "0.78",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            600,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-metamorphosis",
          "maxclass": "message",
          "text": "0.62",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            648,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-contrast",
          "maxclass": "message",
          "text": "0.72",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            696,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-symmetry",
          "maxclass": "message",
          "text": "0.68",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            744,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-silence",
          "maxclass": "message",
          "text": "0.55",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            792,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "init-lyricism",
          "maxclass": "message",
          "text": "0.8",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            840,
            1140,
            38,
            22
          ]
        }
      },
      {
        "box": {
          "id": "score-setup",
          "maxclass": "message",
          "text": "numvoices 10, clefs G G G F FG FG G G Alto F, voicenames [ Flute ] [ Clarinet ] [ Trumpet ] [ Trombone ] [ Celesta ] [ Harp ] [ Glockenspiel ] [ Violin ] [ Viola ] [ Violoncello ], midichannels 1 2 3 4 5 6 7 8 9 10, slotinfo [ 24 [ name annotation ] [ type text ] ] [ 25 [ name phrase-slur-metadata ] [ type text ] ], linkdynamicstoslot 20, linkarticulationstoslot 22, linkannotationtoslot 24, annotationfontsize 9, dynamicsfontsize 12, voicespacing 18 34 46 34 50 38 38 50 34 34 22, vzoom 100, thinannotations 1",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            890,
            1140,
            850,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "profile-select",
            0
          ],
          "destination": [
            "profile-tempo-0",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            0
          ],
          "destination": [
            "profile-activity-0",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            0
          ],
          "destination": [
            "profile-dynamics-0",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "profile-tempo-0",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-activity-0",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-dynamics-0",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            1
          ],
          "destination": [
            "profile-tempo-1",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            1
          ],
          "destination": [
            "profile-activity-1",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            1
          ],
          "destination": [
            "profile-dynamics-1",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "profile-tempo-1",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-activity-1",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-dynamics-1",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            2
          ],
          "destination": [
            "profile-tempo-2",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            2
          ],
          "destination": [
            "profile-activity-2",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            2
          ],
          "destination": [
            "profile-dynamics-2",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "profile-tempo-2",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-activity-2",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-dynamics-2",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            3
          ],
          "destination": [
            "profile-tempo-3",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            3
          ],
          "destination": [
            "profile-activity-3",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            3
          ],
          "destination": [
            "profile-dynamics-3",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "profile-tempo-3",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-activity-3",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-dynamics-3",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            4
          ],
          "destination": [
            "profile-tempo-4",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            4
          ],
          "destination": [
            "profile-activity-4",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            4
          ],
          "destination": [
            "profile-dynamics-4",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "profile-tempo-4",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-activity-4",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-dynamics-4",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            5
          ],
          "destination": [
            "profile-tempo-5",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            5
          ],
          "destination": [
            "profile-activity-5",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "profile-select",
            5
          ],
          "destination": [
            "profile-dynamics-5",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "profile-tempo-5",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-activity-5",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-dynamics-5",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-menu",
            0
          ],
          "destination": [
            "profile-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-trigger",
            1
          ],
          "destination": [
            "profile-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-trigger",
            0
          ],
          "destination": [
            "profile-select",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "profile-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "seed-number",
            0
          ],
          "destination": [
            "seed-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "seed-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "event-number",
            0
          ],
          "destination": [
            "events-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "events-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tempo-number",
            0
          ],
          "destination": [
            "tempo-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tempo-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "density-number",
            0
          ],
          "destination": [
            "density-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "density-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "coherence-number",
            0
          ],
          "destination": [
            "coherence-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "coherence-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metamorphosis-number",
            0
          ],
          "destination": [
            "metamorphosis-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metamorphosis-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "contrast-number",
            0
          ],
          "destination": [
            "contrast-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "contrast-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "symmetry-number",
            0
          ],
          "destination": [
            "symmetry-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "symmetry-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "silence-number",
            0
          ],
          "destination": [
            "silence-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "silence-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lyricism-number",
            0
          ],
          "destination": [
            "lyricism-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lyricism-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "generate-button",
            0
          ],
          "destination": [
            "generate-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "generate-trigger",
            2
          ],
          "destination": [
            "activity-listdump",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "activity-listdump",
            0
          ],
          "destination": [
            "activity-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "activity-function",
            2
          ],
          "destination": [
            "activity-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "activity-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "generate-trigger",
            1
          ],
          "destination": [
            "dynamics-listdump",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dynamics-listdump",
            0
          ],
          "destination": [
            "dynamics-function",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dynamics-function",
            2
          ],
          "destination": [
            "dynamics-prepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dynamics-prepend",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "generate-trigger",
            0
          ],
          "destination": [
            "generate-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "generate-message",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "build-button",
            0
          ],
          "destination": [
            "build-refresh-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "build-refresh-trigger",
            3
          ],
          "destination": [
            "activity-listdump",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "build-refresh-trigger",
            2
          ],
          "destination": [
            "dynamics-listdump",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "build-refresh-trigger",
            1
          ],
          "destination": [
            "generate-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "build-refresh-trigger",
            0
          ],
          "destination": [
            "build-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "build-message",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clear-button",
            0
          ],
          "destination": [
            "clear-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clear-message",
            0
          ],
          "destination": [
            "engine-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine-receive",
            0
          ],
          "destination": [
            "core",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "core",
            0
          ],
          "destination": [
            "score",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "core",
            1
          ],
          "destination": [
            "row-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "row-set",
            0
          ],
          "destination": [
            "row-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "core",
            2
          ],
          "destination": [
            "status-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "status-set",
            0
          ],
          "destination": [
            "status-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play-button",
            0
          ],
          "destination": [
            "play-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play-message",
            0
          ],
          "destination": [
            "score",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop-button",
            0
          ],
          "destination": [
            "stop-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop-message",
            0
          ],
          "destination": [
            "score",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "export-button",
            0
          ],
          "destination": [
            "export-message",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "export-message",
            0
          ],
          "destination": [
            "score",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loadbang",
            0
          ],
          "destination": [
            "init-trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            11
          ],
          "destination": [
            "init-profile",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-profile",
            0
          ],
          "destination": [
            "profile-menu",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            10
          ],
          "destination": [
            "init-seed",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-seed",
            0
          ],
          "destination": [
            "seed-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            9
          ],
          "destination": [
            "init-events",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-events",
            0
          ],
          "destination": [
            "event-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            8
          ],
          "destination": [
            "init-tempo",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-tempo",
            0
          ],
          "destination": [
            "tempo-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            7
          ],
          "destination": [
            "init-density",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-density",
            0
          ],
          "destination": [
            "density-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            6
          ],
          "destination": [
            "init-coherence",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-coherence",
            0
          ],
          "destination": [
            "coherence-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            5
          ],
          "destination": [
            "init-metamorphosis",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-metamorphosis",
            0
          ],
          "destination": [
            "metamorphosis-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            4
          ],
          "destination": [
            "init-contrast",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-contrast",
            0
          ],
          "destination": [
            "contrast-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            3
          ],
          "destination": [
            "init-symmetry",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-symmetry",
            0
          ],
          "destination": [
            "symmetry-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            2
          ],
          "destination": [
            "init-silence",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-silence",
            0
          ],
          "destination": [
            "silence-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            1
          ],
          "destination": [
            "init-lyricism",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-lyricism",
            0
          ],
          "destination": [
            "lyricism-number",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-trigger",
            0
          ],
          "destination": [
            "score-setup",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "score-setup",
            0
          ],
          "destination": [
            "score",
            0
          ]
        }
      }
    ],
    "bgcolor": [
      0.055,
      0.061,
      0.075,
      1
    ],
    "editing_bgcolor": [
      0.055,
      0.061,
      0.075,
      1
    ],
    "dependency_cache": [
      {
        "name": "webernPersonaEngine.js",
        "type": "TEXT",
        "patcherrelativepath": ".",
        "implicit": 1
      },
      {
        "name": "webern_persona_profiles.json",
        "type": "JSON",
        "patcherrelativepath": ".",
        "implicit": 1
      },
      {
        "name": "bach.roll.mxo",
        "type": "iLaX"
      },
      {
        "name": "bach.score.mxo",
        "type": "iLaX"
      },
      {
        "name": "bach.quantize.mxo",
        "type": "iLaX"
      }
    ]
  }
}
