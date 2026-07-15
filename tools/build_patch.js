#!/usr/bin/env node

/*
 * Build the complete Max patch from a small, reviewable JavaScript model.
 * (c) Dmitrii Shchukin 2026
 */

const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const target = path.join(root, "max", "WebernPersona.maxpat");
const voiceTarget = path.join(root, "max", "WebernVoice.maxpat");

const APP_VERSION = {
    major: 8,
    minor: 6,
    revision: 5,
    architecture: "x64",
    modernui: 1
};

const COLORS = {
    background: [0.055, 0.061, 0.075, 1],
    panel: [0.105, 0.116, 0.14, 1],
    panelBorder: [0.21, 0.23, 0.28, 1],
    text: [0.93, 0.94, 0.96, 1],
    muted: [0.61, 0.65, 0.72, 1],
    amber: [0.91, 0.61, 0.24, 1],
    amberDark: [0.56, 0.31, 0.11, 1],
    blue: [0.26, 0.53, 0.72, 1],
    red: [0.64, 0.25, 0.25, 1],
    white: [1, 1, 1, 1]
};

function patcherBase(rect) {
    return {
        fileversion: 1,
        appversion: APP_VERSION,
        classnamespace: "box",
        rect,
        bglocked: 0,
        openinpresentation: 0,
        default_fontsize: 12,
        default_fontface: 0,
        default_fontname: "Arial",
        gridonopen: 1,
        gridsize: [15, 15],
        gridsnaponopen: 1,
        objectsnaponopen: 1,
        statusbarvisible: 2,
        toolbarvisible: 1,
        lefttoolbarpinned: 0,
        toptoolbarpinned: 0,
        righttoolbarpinned: 0,
        bottomtoolbarpinned: 0,
        toolbars_unpinned_last_save: 0,
        tallnewobj: 0,
        boxanimatetime: 200,
        enablehscroll: 1,
        enablevscroll: 1,
        devicewidth: 0,
        description: "",
        digest: "",
        tags: "",
        style: "",
        subpatcher_template: "",
        assistshowspatchername: 0,
        boxes: [],
        lines: []
    };
}

function addBox(patcher, box) {
    patcher.boxes.push({ box });
    return box.id;
}

function addLine(patcher, source, sourceOutlet, destination, destinationInlet, order) {
    const patchline = {
        source: [source, sourceOutlet],
        destination: [destination, destinationInlet]
    };
    if (order !== undefined) {
        patchline.order = order;
    }
    patcher.lines.push({ patchline });
}

function objectBox(id, text, rect, inlets = 1, outlets = 1, outlettype = [""]) {
    return {
        id,
        maxclass: "newobj",
        text,
        numinlets: inlets,
        numoutlets: outlets,
        outlettype,
        patching_rect: rect
    };
}

function messageBox(id, text, rect) {
    return {
        id,
        maxclass: "message",
        text,
        numinlets: 2,
        numoutlets: 1,
        outlettype: [""],
        patching_rect: rect
    };
}

function commentBox(id, text, rect, fontsize = 12, color = COLORS.text, face = 0) {
    return {
        id,
        maxclass: "comment",
        text,
        fontsize,
        fontface: face,
        textcolor: color,
        numinlets: 1,
        numoutlets: 0,
        patching_rect: rect,
        presentation: 1,
        presentation_rect: rect
    };
}

function uiBox(box, rect) {
    box.patching_rect = rect;
    box.presentation = 1;
    box.presentation_rect = rect;
    return box;
}

function panelBox(id, rect) {
    return uiBox({
        id,
        maxclass: "panel",
        mode: 0,
        angle: 270,
        bgcolor: COLORS.panel,
        border: 1,
        bordercolor: COLORS.panelBorder,
        rounded: 12,
        background: 1,
        ignoreclick: 1,
        numinlets: 1,
        numoutlets: 0
    }, rect);
}

function createSynthVoicePatcher() {
    const voice = patcherBase([120, 120, 690, 430]);
    voice.bgcolor = [0.12, 0.13, 0.15, 1];
    voice.description = "Internal audition voice for WebernPersona · (c) Dmitrii Shchukin 2026";

    addBox(voice, objectBox("voice-in", "in 1", [36, 38, 35, 22], 1, 1, [""]));
    addBox(voice, objectBox("voice-unpack", "unpack f i f", [36, 82, 88, 22], 1, 3, ["float", "int", "float"]));
    addBox(voice, objectBox("voice-pitch-trigger", "t b f", [36, 126, 38, 22], 1, 2, ["bang", "float"]));
    addBox(voice, objectBox("voice-cents-midi", "/ 100.", [92, 126, 45, 22], 2, 1, ["float"]));
    addBox(voice, objectBox("voice-mtof", "mtof", [92, 160, 35, 22], 1, 1, ["float"]));
    addBox(voice, objectBox("voice-osc", "cycle~ 440", [92, 198, 68, 22], 2, 1, ["signal"]));
    addBox(voice, objectBox("voice-velocity", "/ 127.", [190, 126, 45, 22], 2, 1, ["float"]));
    addBox(voice, objectBox("voice-velocity-signal", "sig~", [190, 160, 35, 22], 1, 1, ["signal"]));
    addBox(voice, objectBox("voice-duration", "clip 40. 12000.", [270, 126, 96, 22], 3, 1, ["float"]));
    addBox(voice, objectBox("voice-delay", "delay 500", [270, 160, 58, 22], 2, 1, ["bang"]));
    addBox(voice, messageBox("voice-gate-on", "1.", [36, 160, 30, 22]));
    addBox(voice, messageBox("voice-gate-off", "0.", [270, 198, 30, 22]));
    addBox(voice, objectBox("voice-envelope", "adsr~ 8. 35. 0.7 120.", [205, 238, 132, 22], 5, 4, ["signal", "signal", "", ""]));
    addBox(voice, objectBox("voice-amp-envelope", "*~", [92, 272, 35, 22], 2, 1, ["signal"]));
    addBox(voice, objectBox("voice-amp-velocity", "*~", [92, 306, 35, 22], 2, 1, ["signal"]));
    addBox(voice, objectBox("voice-level", "*~ 0.16", [92, 340, 55, 22], 2, 1, ["signal"]));
    addBox(voice, objectBox("voice-out", "out~ 1", [92, 378, 42, 22], 1, 0, []));
    addBox(voice, objectBox("voice-thispoly", "thispoly~", [410, 272, 58, 22], 1, 2, ["int", "int"]));
    addBox(voice, objectBox("voice-loadmute", "loadmess mute 1", [410, 238, 102, 22], 1, 1, [""]));

    addLine(voice, "voice-in", 0, "voice-unpack", 0);
    addLine(voice, "voice-unpack", 2, "voice-duration", 0);
    addLine(voice, "voice-duration", 0, "voice-delay", 1);
    addLine(voice, "voice-unpack", 1, "voice-velocity", 0);
    addLine(voice, "voice-velocity", 0, "voice-velocity-signal", 0);
    addLine(voice, "voice-unpack", 0, "voice-pitch-trigger", 0);
    addLine(voice, "voice-pitch-trigger", 1, "voice-cents-midi", 0);
    addLine(voice, "voice-cents-midi", 0, "voice-mtof", 0);
    addLine(voice, "voice-mtof", 0, "voice-osc", 0);
    addLine(voice, "voice-pitch-trigger", 0, "voice-gate-on", 0, 0);
    addLine(voice, "voice-pitch-trigger", 0, "voice-delay", 0, 1);
    addLine(voice, "voice-gate-on", 0, "voice-envelope", 0);
    addLine(voice, "voice-delay", 0, "voice-gate-off", 0);
    addLine(voice, "voice-gate-off", 0, "voice-envelope", 0);
    addLine(voice, "voice-osc", 0, "voice-amp-envelope", 0);
    addLine(voice, "voice-envelope", 0, "voice-amp-envelope", 1);
    addLine(voice, "voice-amp-envelope", 0, "voice-amp-velocity", 0);
    addLine(voice, "voice-velocity-signal", 0, "voice-amp-velocity", 1);
    addLine(voice, "voice-amp-velocity", 0, "voice-level", 0);
    addLine(voice, "voice-level", 0, "voice-out", 0);
    addLine(voice, "voice-loadmute", 0, "voice-thispoly", 0);
    addLine(voice, "voice-envelope", 2, "voice-thispoly", 0);
    return voice;
}

function textButton(id, text, rect, color) {
    return uiBox({
        id,
        maxclass: "textbutton",
        text,
        texton: text,
        fontsize: 13,
        fontface: 1,
        textcolor: COLORS.white,
        textoncolor: COLORS.white,
        bgcolor: color,
        bgcolor2: color,
        rounded: 8,
        mode: 0,
        numinlets: 1,
        numoutlets: 1,
        outlettype: [""]
    }, rect);
}

function createCorePatcher() {
    const core = patcherBase([80, 80, 940, 560]);
    core.bgcolor = [0.12, 0.13, 0.15, 1];

    addBox(core, {
        id: "core-in",
        index: 1,
        maxclass: "inlet",
        comment: "engine messages",
        numinlets: 0,
        numoutlets: 1,
        outlettype: [""],
        patching_rect: [40, 50, 30, 30]
    });
    addBox(core, objectBox("core-route", "route buildscore tempo", [105, 54, 151, 22], 1, 3, ["bang", "", ""]));
    addBox(core, objectBox("core-js", "js webernPersonaEngine.js", [330, 165, 164, 22], 1, 4, ["", "", "", ""]));

    addBox(core, {
        id: "core-roll",
        maxclass: "bach.roll",
        numinlets: 6,
        numoutlets: 8,
        outlettype: ["", "", "", "", "", "", "", "bang"],
        numvoices: 10,
        clefs: ["G", "G", "G", "F", "FG", "FG", "G", "G", "Alto", "F"],
        voicenames: ["Flute", "Clarinet", "Trumpet", "Trombone", "Celesta", "Harp", "Glockenspiel", "Violin", "Viola", "Violoncello"],
        midichannels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        autosize: 1,
        patching_rect: [330, 230, 340, 150],
        versionnumber: 80200
    });

    addBox(core, objectBox(
        "core-quantize",
        "bach.quantize @minimalunits 1/16 1/12 1/8 @smalleventshandling 0",
        [330, 420, 402, 22],
        3,
        2,
        ["", ""]
    ));
    // Right-to-left order is deliberate: announce the request, dump the roll,
    // then provide measure/tempo information to bach.quantize. This mirrors
    // bach's official roll-to-score example without converting native lllls.
    addBox(core, objectBox("core-build-trigger", "t b b b", [105, 115, 58, 22], 1, 3, ["bang", "bang", "bang"]));
    addBox(core, messageBox("core-quantize-status", "quantize_requested", [105, 145, 119, 22]));
    addBox(core, messageBox("core-quantize-message", "quantize", [175, 145, 58, 22]));
    addBox(core, objectBox("core-tempo-store", "i 60", [105, 185, 36, 22], 2, 1, ["int"]));
    addBox(core, messageBox("core-measureinfo", "[4 4] [$1]", [105, 230, 72, 22]));
    addBox(core, objectBox("core-tempo-trigger", "t i i", [225, 95, 42, 22], 1, 2, ["int", "int"]));
    addBox(core, objectBox("core-prepend-tempo", "prepend tempo", [225, 130, 93, 22], 1, 1, [""]));
    addBox(core, objectBox("core-score-arrived", "t b", [750, 420, 30, 22], 1, 1, ["bang"]));
    addBox(core, messageBox("core-score-status", "score_data_received", [790, 385, 126, 22]));
    addBox(core, objectBox("core-defer", "deferlow", [750, 365, 55, 22], 1, 1, ["bang"]));
    addBox(core, messageBox("core-decorate", "decorate", [750, 320, 62, 22]));

    addBox(core, {
        id: "core-score-out",
        index: 1,
        maxclass: "outlet",
        comment: "bach.score data and commands",
        numinlets: 1,
        numoutlets: 0,
        patching_rect: [500, 500, 30, 30]
    });
    addBox(core, {
        id: "core-row-out",
        index: 2,
        maxclass: "outlet",
        comment: "row",
        numinlets: 1,
        numoutlets: 0,
        patching_rect: [565, 500, 30, 30]
    });
    addBox(core, {
        id: "core-status-out",
        index: 3,
        maxclass: "outlet",
        comment: "status",
        numinlets: 1,
        numoutlets: 0,
        patching_rect: [630, 500, 30, 30]
    });

    addLine(core, "core-in", 0, "core-route", 0);
    addLine(core, "core-route", 0, "core-build-trigger", 0);
    addLine(core, "core-route", 1, "core-tempo-trigger", 0);
    addLine(core, "core-route", 2, "core-js", 0);
    addLine(core, "core-tempo-trigger", 1, "core-tempo-store", 1);
    addLine(core, "core-tempo-trigger", 0, "core-prepend-tempo", 0);
    addLine(core, "core-prepend-tempo", 0, "core-js", 0);

    addLine(core, "core-build-trigger", 2, "core-quantize-status", 0);
    addLine(core, "core-quantize-status", 0, "core-status-out", 0);
    addLine(core, "core-build-trigger", 1, "core-quantize-message", 0);
    addLine(core, "core-quantize-message", 0, "core-roll", 0);
    addLine(core, "core-build-trigger", 0, "core-tempo-store", 0);
    addLine(core, "core-tempo-store", 0, "core-measureinfo", 0);
    addLine(core, "core-measureinfo", 0, "core-quantize", 0);
    addLine(core, "core-js", 0, "core-roll", 0);
    addLine(core, "core-roll", 0, "core-quantize", 1);

    // Native bach llll goes straight to bach.score. A second ordered branch
    // only derives a bang for deferred decoration and never touches the data.
    addLine(core, "core-quantize", 0, "core-score-out", 0, 0);
    addLine(core, "core-quantize", 0, "core-score-arrived", 0, 1);
    addLine(core, "core-score-arrived", 0, "core-score-status", 0);
    addLine(core, "core-score-status", 0, "core-status-out", 0, 0);
    addLine(core, "core-score-arrived", 0, "core-defer", 0, 1);
    addLine(core, "core-defer", 0, "core-decorate", 0);
    addLine(core, "core-decorate", 0, "core-js", 0);
    addLine(core, "core-js", 1, "core-row-out", 0);
    addLine(core, "core-js", 2, "core-status-out", 0);
    addLine(core, "core-js", 3, "core-score-out", 0);

    return core;
}

function createMainPatcher() {
    const patcher = patcherBase([30, 45, 1440, 1138]);
    patcher.openinpresentation = 1;
    patcher.bgcolor = COLORS.background;
    patcher.editing_bgcolor = COLORS.background;
    patcher.description = "Computational Modeling of Webern's Op. 10 · (c) Dmitrii Shchukin 2026";

    addBox(patcher, panelBox("material-panel", [28, 74, 405, 225]));
    addBox(patcher, panelBox("activity-panel", [449, 74, 446, 225]));
    addBox(patcher, panelBox("dynamics-panel", [911, 74, 501, 225]));

    addBox(patcher, commentBox("title", "VON WEBERN", [30, 18, 260, 34], 25, COLORS.text, 1));
    addBox(patcher, commentBox("subtitle", "research-informed score generator / op. 10", [222, 29, 390, 22], 12, COLORS.muted, 0));
    addBox(patcher, commentBox("copyright", "(c) Dmitrii Shchukin 2026", [1132, 29, 280, 20], 10, COLORS.muted, 0));
    addBox(patcher, commentBox("material-title", "MATERIAL", [48, 91, 130, 22], 14, COLORS.amber, 1));
    addBox(patcher, commentBox("activity-title", "ACTIVITY / TIME", [469, 91, 180, 22], 14, COLORS.blue, 1));
    addBox(patcher, commentBox("dynamics-title", "DYNAMICS / TIME", [931, 91, 180, 22], 14, COLORS.amber, 1));

    addBox(patcher, commentBox("profile-label", "Profile", [48, 126, 60, 20], 11, COLORS.muted));
    addBox(patcher, uiBox({
        id: "profile-menu",
        maxclass: "umenu",
        items: [
            "Op.10 synthesis", ",",
            "I - Sehr ruhig und zart", ",",
            "II - Lebhaft und zart bewegt", ",",
            "III - Sehr langsam und äußerst ruhig", ",",
            "IV - Fließend, äußerst zart", ",",
            "V - Sehr fließend"
        ],
        fontsize: 11,
        bgcolor: [0.16, 0.17, 0.2, 1],
        textcolor: COLORS.text,
        parameter_enable: 0,
        numinlets: 1,
        numoutlets: 3,
        outlettype: ["int", "", ""]
    }, [112, 123, 297, 24]));

    const numericControls = [
        ["seed-number", "Seed", [48, 160, 55, 20], [104, 157, 66, 24], 1, 2147483646],
        ["event-number", "Events", [183, 160, 55, 20], [240, 157, 55, 24], 1, 240],
        ["tempo-number", "BPM", [307, 160, 40, 20], [349, 157, 60, 24], 24, 180]
    ];
    numericControls.forEach(([id, label, labelRect, rect, minimum, maximum]) => {
        addBox(patcher, commentBox(`${id}-label`, label, labelRect, 11, COLORS.muted));
        addBox(patcher, uiBox({
            id,
            maxclass: "number",
            minimum,
            maximum,
            fontsize: 12,
            bgcolor: [0.16, 0.17, 0.2, 1],
            textcolor: COLORS.text,
            triangle: 0,
            parameter_enable: 0,
            numinlets: 1,
            numoutlets: 2,
            outlettype: ["", "bang"]
        }, rect));
    });

    addBox(patcher, commentBox("density-label", "Texture density", [48, 194, 95, 20], 11, COLORS.muted));
    addBox(patcher, uiBox({
        id: "density-number",
        maxclass: "flonum",
        minimum: 0,
        maximum: 1,
        format: 6,
        fontsize: 12,
        bgcolor: [0.16, 0.17, 0.2, 1],
        textcolor: COLORS.text,
        triangle: 0,
        parameter_enable: 0,
        numinlets: 1,
        numoutlets: 2,
        outlettype: ["", "bang"]
    }, [145, 191, 60, 24]));

    addBox(patcher, textButton("generate-button", "1  GENERATE MATERIAL", [48, 235, 220, 42], COLORS.amberDark));
    addBox(patcher, textButton("build-button", "2  BUILD SCORE", [278, 235, 131, 42], [0.19, 0.4, 0.53, 1]));

    addBox(patcher, commentBox("activity-help", "low = spacious / high = rapid", [469, 118, 240, 19], 10, COLORS.muted));
    addBox(patcher, uiBox({
        id: "activity-function",
        maxclass: "function",
        addpoints: [0, 0.24, 0, 420, 0.52, 0, 720, 0.38, 0, 1000, 0.2, 0],
        classic_curve: 1,
        bgcolor: [0.08, 0.09, 0.11, 1],
        bordercolor: COLORS.panelBorder,
        linecolor: COLORS.blue,
        pointcolor: COLORS.white,
        parameter_enable: 0,
        numinlets: 1,
        numoutlets: 4,
        outlettype: ["float", "", "", "bang"]
    }, [469, 140, 406, 118]));
    addBox(patcher, commentBox("activity-axis-left", "beginning", [469, 265, 70, 18], 9, COLORS.muted));
    addBox(patcher, commentBox("activity-axis-right", "ending", [827, 265, 48, 18], 9, COLORS.muted));

    addBox(patcher, commentBox("dynamics-help", "x = time · y = exact dynamic level", [931, 118, 300, 19], 10, COLORS.muted));
    addBox(patcher, uiBox({
        id: "dynamics-function",
        maxclass: "function",
        addpoints: [0, 0.16, 0, 580, 0.54, 0, 780, 0.36, 0, 1000, 0.18, 0],
        classic_curve: 1,
        bgcolor: [0.08, 0.09, 0.11, 1],
        bordercolor: COLORS.panelBorder,
        linecolor: COLORS.amber,
        pointcolor: COLORS.white,
        parameter_enable: 0,
        numinlets: 1,
        numoutlets: 4,
        outlettype: ["float", "", "", "bang"]
    }, [968, 140, 424, 118]));
    addBox(patcher, commentBox("dyn-y-top", "fff", [936, 137, 28, 18], 9, COLORS.muted));
    addBox(patcher, commentBox("dyn-y-bottom", "pppp", [932, 241, 32, 18], 9, COLORS.muted));
    addBox(patcher, commentBox("dyn-x-left", "beginning", [968, 265, 70, 18], 9, COLORS.muted));
    addBox(patcher, commentBox("dyn-x-right", "ending", [1344, 265, 48, 18], 9, COLORS.muted));

    addBox(patcher, commentBox("row-label", "REALIZED ROW", [31, 311, 92, 20], 11, COLORS.amber, 1));
    addBox(patcher, uiBox({
        id: "row-display",
        maxclass: "message",
        text: "-",
        fontsize: 12,
        fontface: 1,
        textcolor: COLORS.text,
        bgcolor: [0.09, 0.1, 0.12, 1],
        border: 0,
        ignoreclick: 1,
        numinlets: 2,
        numoutlets: 1,
        outlettype: [""]
    }, [126, 307, 467, 27]));
    addBox(patcher, commentBox("status-label", "STATUS", [618, 311, 54, 20], 11, COLORS.blue, 1));
    addBox(patcher, uiBox({
        id: "status-display",
        maxclass: "message",
        text: "ready",
        fontsize: 11,
        textcolor: COLORS.muted,
        bgcolor: [0.09, 0.1, 0.12, 1],
        border: 0,
        ignoreclick: 1,
        numinlets: 2,
        numoutlets: 1,
        outlettype: [""]
    }, [675, 307, 439, 27]));

    addBox(patcher, textButton("clear-button", "CLEAR", [1120, 306, 70, 29], COLORS.red));
    addBox(patcher, textButton("play-button", "PLAY", [1198, 306, 52, 29], [0.2, 0.39, 0.27, 1]));
    addBox(patcher, textButton("stop-button", "STOP", [1258, 306, 52, 29], [0.28, 0.29, 0.32, 1]));
    addBox(patcher, textButton("export-button", "EXPORT XML", [1318, 306, 94, 29], COLORS.amberDark));

    addBox(patcher, panelBox("persona-panel", [28, 348, 1384, 62]));
    addBox(patcher, commentBox("persona-title", "PERSONA / DECISION BIASES", [45, 356, 210, 20], 11, COLORS.blue, 1));
    addBox(patcher, commentBox("persona-help", "0–1 · coherence, transformation, colour, symmetry and breath", [45, 379, 342, 18], 9, COLORS.muted));

    const personaControls = [
        ["coherence-number", "Coherence", [390, 356, 74, 18], [390, 377, 64, 22]],
        ["metamorphosis-number", "Metamorphosis", [480, 356, 92, 18], [480, 377, 64, 22]],
        ["contrast-number", "Timbral contrast", [580, 356, 104, 18], [580, 377, 64, 22]],
        ["symmetry-number", "Symmetry", [700, 356, 70, 18], [700, 377, 64, 22]],
        ["silence-number", "Silence", [790, 356, 54, 18], [790, 377, 64, 22]],
        ["lyricism-number", "Lyrical breath", [880, 356, 90, 18], [880, 377, 64, 22]]
    ];
    personaControls.forEach(([id, label, labelRect, rect]) => {
        addBox(patcher, commentBox(`${id}-label`, label, labelRect, 10, COLORS.muted));
        addBox(patcher, uiBox({
            id,
            maxclass: "flonum",
            minimum: 0,
            maximum: 1,
            format: 6,
            fontsize: 11,
            bgcolor: [0.16, 0.17, 0.2, 1],
            textcolor: COLORS.text,
            triangle: 0,
            parameter_enable: 0,
            numinlets: 1,
            numoutlets: 2,
            outlettype: ["", "bang"]
        }, rect));
    });

    addBox(patcher, uiBox({
        id: "score",
        maxclass: "bach.score",
        numinlets: 7,
        numoutlets: 9,
        outlettype: ["", "", "", "", "", "", "", "", "bang"],
        out: "nnnnnnnn",
        numvoices: 10,
        autosize: 1,
        clefs: ["G", "G", "G", "F", "FG", "FG", "G", "G", "Alto", "F"],
        voicenames: ["Flute", "Clarinet", "Trumpet", "Trombone", "Celesta", "Harp", "Glockenspiel", "Violin", "Viola", "Violoncello"],
        midichannels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        linkdynamicstoslot: 20,
        linkarticulationstoslot: 22,
        linkannotationtoslot: 24,
        thinannotations: 1,
        annotationfontsize: 9,
        dynamicsfontsize: 12,
        voicespacing: [18, 34, 46, 34, 50, 38, 38, 50, 34, 34, 22],
        vzoom: 100,
        zoom: 82,
        legend: 0,
        bgcolor: [0.985, 0.985, 0.98, 1],
        textcolor: [0.08, 0.08, 0.08, 1],
        staffcolor: [0.18, 0.18, 0.18, 1],
        showfirstmeasurenumber: 0,
        finitestaff: 1,
        versionnumber: 80200
    }, [28, 420, 1384, 700]));

    // Clean control bus: presentation objects talk to one named send.
    addBox(patcher, objectBox("engine-send", "s #0-webern-engine", [95, 1000, 126, 22], 1, 0, []));
    addBox(patcher, objectBox("engine-receive", "r #0-webern-engine", [260, 1000, 126, 22], 0, 1, [""]));
    addBox(patcher, {
        id: "core",
        maxclass: "newobj",
        text: "p webern.core",
        numinlets: 1,
        numoutlets: 3,
        outlettype: ["", "", ""],
        patching_rect: [420, 1000, 103, 22],
        patcher: createCorePatcher()
    });

    const prepends = [
        ["profile-prepend", "prepend profile", [95, 1045, 96, 22]],
        ["seed-prepend", "prepend seed", [205, 1045, 88, 22]],
        ["events-prepend", "prepend eventcount", [307, 1045, 121, 22]],
        ["tempo-prepend", "prepend tempo", [442, 1045, 93, 22]],
        ["density-prepend", "prepend density", [549, 1045, 102, 22]],
        ["activity-prepend", "prepend activity", [665, 1045, 104, 22]],
        ["dynamics-prepend", "prepend dynamics", [783, 1045, 113, 22]],
        ["coherence-prepend", "prepend coherence", [95, 1080, 125, 22]],
        ["metamorphosis-prepend", "prepend metamorphosis", [235, 1080, 144, 22]],
        ["contrast-prepend", "prepend timbralcontrast", [394, 1080, 151, 22]],
        ["symmetry-prepend", "prepend symmetry", [560, 1080, 116, 22]],
        ["silence-prepend", "prepend silence", [691, 1080, 106, 22]],
        ["lyricism-prepend", "prepend lyricism", [812, 1080, 116, 22]]
    ];
    prepends.forEach(([id, text, rect]) => addBox(patcher, objectBox(id, text, rect)));
    addBox(patcher, objectBox("generate-trigger", "t b b b", [930, 1045, 59, 22], 1, 3, ["bang", "bang", "bang"]));
    addBox(patcher, objectBox("build-refresh-trigger", "t b b b b", [930, 1080, 70, 22], 1, 4, ["bang", "bang", "bang", "bang"]));
    addBox(patcher, messageBox("activity-listdump", "listdump", [1004, 1027, 58, 22]));
    addBox(patcher, messageBox("dynamics-listdump", "listdump", [1004, 1062, 58, 22]));
    addBox(patcher, messageBox("generate-message", "generate", [1077, 1045, 62, 22]));
    addBox(patcher, messageBox("build-message", "buildscore", [1153, 1045, 70, 22]));
    addBox(patcher, messageBox("clear-message", "clear", [1237, 1045, 38, 22]));
    addBox(patcher, messageBox("play-message", "play", [1289, 1045, 34, 22]));
    addBox(patcher, messageBox("stop-message", "stop", [1337, 1045, 34, 22]));
    addBox(patcher, messageBox("export-message", "exportxml @directionslots 24 25 @exportmarkers 1", [1335, 1045, 235, 22]));
    addBox(patcher, objectBox("row-set", "prepend set", [555, 1000, 81, 22]));
    addBox(patcher, objectBox("status-set", "prepend set", [655, 1000, 81, 22]));
    addBox(patcher, objectBox("play-trigger", "t b b", [1289, 1080, 40, 22], 1, 2, ["bang", "bang"]));
    addBox(patcher, messageBox("audio-on", "1", [1338, 1080, 30, 22]));
    addBox(patcher, objectBox("audio-playkeys", "bach.playkeys cents velocity duration @out t", [1020, 1115, 252, 22], 1, 3, ["", "", ""]));
    addBox(patcher, objectBox("audio-join", "bach.join 3 @out t", [1020, 1148, 116, 22], 3, 1, [""]));
    addBox(patcher, objectBox("audio-note", "prepend note", [1150, 1148, 84, 22], 1, 1, [""]));
    addBox(patcher, objectBox("audio-poly", "poly~ WebernVoice 16 @steal 1", [1248, 1148, 184, 22], 1, 1, ["signal"]));
    addBox(patcher, objectBox("audio-level", "*~ 0.8", [1248, 1180, 48, 22], 2, 1, ["signal"]));
    addBox(patcher, {
        id: "audio-dac",
        maxclass: "ezdac~",
        numinlets: 2,
        numoutlets: 0,
        patching_rect: [1312, 1177, 45, 45]
    });
    addBox(patcher, objectBox("profile-trigger", "t i i", [95, 1185, 42, 22], 1, 2, ["int", "int"]));
    addBox(patcher, objectBox("profile-select", "sel 0 1 2 3 4 5", [150, 1185, 118, 22], 1, 7, ["bang", "bang", "bang", "bang", "bang", "bang", ""]));

    const profilePresets = [
        { tempo: 60, activity: [[0, 0.28], [420, 0.48], [700, 0.34], [1000, 0.22]], dynamics: [[0, 0.18], [550, 0.46], [760, 0.34], [1000, 0.2]] },
        { tempo: 50, activity: [[0, 0.2], [440, 0.48], [630, 0.42], [1000, 0.12]], dynamics: [[0, 0.08], [500, 0.25], [1000, 0.1]] },
        { tempo: 100, activity: [[0, 0.46], [350, 0.58], [720, 0.7], [1000, 0.94]], dynamics: [[0, 0.18], [500, 0.46], [820, 0.78], [1000, 1]] },
        { tempo: 40, activity: [[0, 0.12], [480, 0.2], [720, 0.3], [1000, 0.12]], dynamics: [[0, 0.06], [580, 0.3], [780, 0.42], [1000, 0.1]] },
        { tempo: 60, activity: [[0, 0.32], [460, 0.48], [720, 0.28], [1000, 0.12]], dynamics: [[0, 0.1], [520, 0.3], [1000, 0.08]] },
        { tempo: 152, activity: [[0, 0.62], [480, 0.8], [620, 1], [760, 0.3], [1000, 0.08]], dynamics: [[0, 0.34], [500, 0.72], [620, 1], [800, 0.16], [1000, 0.04]] }
    ];
    profilePresets.forEach((preset, index) => {
        const x = 285 + index * 190;
        const pointMessage = (points) => `clear, ${points.map((point) => `${point[0]} ${point[1]}`).join(", ")}`;
        addBox(patcher, messageBox(`profile-tempo-${index}`, String(preset.tempo), [x, 1185, 42, 22]));
        addBox(patcher, messageBox(`profile-activity-${index}`, pointMessage(preset.activity), [x, 1217, 180, 22]));
        addBox(patcher, messageBox(`profile-dynamics-${index}`, pointMessage(preset.dynamics), [x, 1249, 180, 22]));
        addLine(patcher, "profile-select", index, `profile-tempo-${index}`, 0, 0);
        addLine(patcher, "profile-select", index, `profile-activity-${index}`, 0, 1);
        addLine(patcher, "profile-select", index, `profile-dynamics-${index}`, 0, 2);
        addLine(patcher, `profile-tempo-${index}`, 0, "tempo-number", 0);
        addLine(patcher, `profile-activity-${index}`, 0, "activity-function", 0);
        addLine(patcher, `profile-dynamics-${index}`, 0, "dynamics-function", 0);
    });

    // Initialization is explicit and visually grouped in edit mode.
    addBox(patcher, objectBox("loadbang", "loadbang", [95, 1140, 59, 22], 1, 1, ["bang"]));
    addBox(patcher, objectBox("init-trigger", "t b b b b b b b b b b b b", [170, 1140, 196, 22], 1, 12, ["bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang", "bang"]));
    addBox(patcher, messageBox("init-profile", "0", [380, 1140, 30, 22]));
    addBox(patcher, messageBox("init-seed", "1913", [420, 1140, 42, 22]));
    addBox(patcher, messageBox("init-events", "25", [472, 1140, 30, 22]));
    addBox(patcher, messageBox("init-tempo", "60", [512, 1140, 30, 22]));
    addBox(patcher, messageBox("init-density", "0.45", [552, 1140, 38, 22]));
    addBox(patcher, messageBox("init-coherence", "0.78", [600, 1140, 38, 22]));
    addBox(patcher, messageBox("init-metamorphosis", "0.62", [648, 1140, 38, 22]));
    addBox(patcher, messageBox("init-contrast", "0.72", [696, 1140, 38, 22]));
    addBox(patcher, messageBox("init-symmetry", "0.68", [744, 1140, 38, 22]));
    addBox(patcher, messageBox("init-silence", "0.55", [792, 1140, 38, 22]));
    addBox(patcher, messageBox("init-lyricism", "0.8", [840, 1140, 38, 22]));
    addBox(patcher, messageBox(
        "score-setup",
        "numvoices 10, clefs G G G F FG FG G G Alto F, voicenames [ Flute ] [ Clarinet ] [ Trumpet ] [ Trombone ] [ Celesta ] [ Harp ] [ Glockenspiel ] [ Violin ] [ Viola ] [ Violoncello ], midichannels 1 2 3 4 5 6 7 8 9 10, slotinfo [ 24 [ name annotation ] [ type text ] ] [ 25 [ name phrase-slur-metadata ] [ type text ] ], linkdynamicstoslot 20, linkarticulationstoslot 22, linkannotationtoslot 24, annotationfontsize 9, dynamicsfontsize 12, voicespacing 18 34 46 34 50 38 38 50 34 34 22, vzoom 100, thinannotations 1",
        [890, 1140, 850, 22]
    ));

    // UI values to engine bus.
    addLine(patcher, "profile-menu", 0, "profile-trigger", 0);
    addLine(patcher, "profile-trigger", 1, "profile-prepend", 0);
    addLine(patcher, "profile-trigger", 0, "profile-select", 0);
    addLine(patcher, "profile-prepend", 0, "engine-send", 0);
    addLine(patcher, "seed-number", 0, "seed-prepend", 0);
    addLine(patcher, "seed-prepend", 0, "engine-send", 0);
    addLine(patcher, "event-number", 0, "events-prepend", 0);
    addLine(patcher, "events-prepend", 0, "engine-send", 0);
    addLine(patcher, "tempo-number", 0, "tempo-prepend", 0);
    addLine(patcher, "tempo-prepend", 0, "engine-send", 0);
    addLine(patcher, "density-number", 0, "density-prepend", 0);
    addLine(patcher, "density-prepend", 0, "engine-send", 0);
    addLine(patcher, "coherence-number", 0, "coherence-prepend", 0);
    addLine(patcher, "coherence-prepend", 0, "engine-send", 0);
    addLine(patcher, "metamorphosis-number", 0, "metamorphosis-prepend", 0);
    addLine(patcher, "metamorphosis-prepend", 0, "engine-send", 0);
    addLine(patcher, "contrast-number", 0, "contrast-prepend", 0);
    addLine(patcher, "contrast-prepend", 0, "engine-send", 0);
    addLine(patcher, "symmetry-number", 0, "symmetry-prepend", 0);
    addLine(patcher, "symmetry-prepend", 0, "engine-send", 0);
    addLine(patcher, "silence-number", 0, "silence-prepend", 0);
    addLine(patcher, "silence-prepend", 0, "engine-send", 0);
    addLine(patcher, "lyricism-number", 0, "lyricism-prepend", 0);
    addLine(patcher, "lyricism-prepend", 0, "engine-send", 0);

    // Generate dumps both curves before asking the engine to generate.
    addLine(patcher, "generate-button", 0, "generate-trigger", 0);
    addLine(patcher, "generate-trigger", 2, "activity-listdump", 0);
    addLine(patcher, "activity-listdump", 0, "activity-function", 0);
    addLine(patcher, "activity-function", 2, "activity-prepend", 0);
    addLine(patcher, "activity-prepend", 0, "engine-send", 0);
    addLine(patcher, "generate-trigger", 1, "dynamics-listdump", 0);
    addLine(patcher, "dynamics-listdump", 0, "dynamics-function", 0);
    addLine(patcher, "dynamics-function", 2, "dynamics-prepend", 0);
    addLine(patcher, "dynamics-prepend", 0, "engine-send", 0);
    addLine(patcher, "generate-trigger", 0, "generate-message", 0);
    addLine(patcher, "generate-message", 0, "engine-send", 0);

    // Build is a true rebuild: first read both edited time-curves, then make a
    // fresh row and event field, and only then quantize/decorate the score.
    addLine(patcher, "build-button", 0, "build-refresh-trigger", 0);
    addLine(patcher, "build-refresh-trigger", 3, "activity-listdump", 0);
    addLine(patcher, "build-refresh-trigger", 2, "dynamics-listdump", 0);
    addLine(patcher, "build-refresh-trigger", 1, "generate-message", 0);
    addLine(patcher, "build-refresh-trigger", 0, "build-message", 0);
    addLine(patcher, "build-message", 0, "engine-send", 0);
    addLine(patcher, "clear-button", 0, "clear-message", 0);
    addLine(patcher, "clear-message", 0, "engine-send", 0);

    addLine(patcher, "engine-receive", 0, "core", 0);
    addLine(patcher, "core", 0, "score", 0);
    addLine(patcher, "core", 1, "row-set", 0);
    addLine(patcher, "row-set", 0, "row-display", 0);
    addLine(patcher, "core", 2, "status-set", 0);
    addLine(patcher, "status-set", 0, "status-display", 0);

    addLine(patcher, "play-button", 0, "play-trigger", 0);
    addLine(patcher, "play-trigger", 1, "audio-on", 0);
    addLine(patcher, "audio-on", 0, "audio-dac", 0);
    addLine(patcher, "play-trigger", 0, "play-message", 0);
    addLine(patcher, "play-message", 0, "score", 0);
    addLine(patcher, "stop-button", 0, "stop-message", 0);
    addLine(patcher, "stop-message", 0, "score", 0);
    addLine(patcher, "export-button", 0, "export-message", 0);
    addLine(patcher, "export-message", 0, "score", 0);

    // bach.score's playout outlet (index 7) carries note data.  bach.playkeys
    // extracts MIDIcents, velocity and duration, and the bundled poly~ voice
    // provides an audible reference without external MIDI configuration.
    addLine(patcher, "score", 7, "audio-playkeys", 0);
    addLine(patcher, "audio-playkeys", 2, "audio-join", 2);
    addLine(patcher, "audio-playkeys", 1, "audio-join", 1);
    addLine(patcher, "audio-playkeys", 0, "audio-join", 0);
    addLine(patcher, "audio-join", 0, "audio-note", 0);
    addLine(patcher, "audio-note", 0, "audio-poly", 0);
    addLine(patcher, "audio-poly", 0, "audio-level", 0);
    addLine(patcher, "audio-level", 0, "audio-dac", 0);
    addLine(patcher, "audio-level", 0, "audio-dac", 1);

    // Initialization.
    addLine(patcher, "loadbang", 0, "init-trigger", 0);
    addLine(patcher, "init-trigger", 11, "init-profile", 0);
    addLine(patcher, "init-profile", 0, "profile-menu", 0);
    addLine(patcher, "init-trigger", 10, "init-seed", 0);
    addLine(patcher, "init-seed", 0, "seed-number", 0);
    addLine(patcher, "init-trigger", 9, "init-events", 0);
    addLine(patcher, "init-events", 0, "event-number", 0);
    addLine(patcher, "init-trigger", 8, "init-tempo", 0);
    addLine(patcher, "init-tempo", 0, "tempo-number", 0);
    addLine(patcher, "init-trigger", 7, "init-density", 0);
    addLine(patcher, "init-density", 0, "density-number", 0);
    addLine(patcher, "init-trigger", 6, "init-coherence", 0);
    addLine(patcher, "init-coherence", 0, "coherence-number", 0);
    addLine(patcher, "init-trigger", 5, "init-metamorphosis", 0);
    addLine(patcher, "init-metamorphosis", 0, "metamorphosis-number", 0);
    addLine(patcher, "init-trigger", 4, "init-contrast", 0);
    addLine(patcher, "init-contrast", 0, "contrast-number", 0);
    addLine(patcher, "init-trigger", 3, "init-symmetry", 0);
    addLine(patcher, "init-symmetry", 0, "symmetry-number", 0);
    addLine(patcher, "init-trigger", 2, "init-silence", 0);
    addLine(patcher, "init-silence", 0, "silence-number", 0);
    addLine(patcher, "init-trigger", 1, "init-lyricism", 0);
    addLine(patcher, "init-lyricism", 0, "lyricism-number", 0);
    addLine(patcher, "init-trigger", 0, "score-setup", 0);
    addLine(patcher, "score-setup", 0, "score", 0);

    patcher.dependency_cache = [
        { name: "webernPersonaEngine.js", type: "TEXT", patcherrelativepath: ".", implicit: 1 },
        { name: "WebernVoice.maxpat", type: "JSON", patcherrelativepath: ".", implicit: 1 },
        { name: "webern_persona_profiles.json", type: "JSON", patcherrelativepath: ".", implicit: 1 },
        { name: "bach.roll.mxo", type: "iLaX" },
        { name: "bach.score.mxo", type: "iLaX" },
        { name: "bach.quantize.mxo", type: "iLaX" }
        ,{ name: "bach.playkeys.mxo", type: "iLaX" }
        ,{ name: "bach.join.mxo", type: "iLaX" }
    ];
    return patcher;
}

const document = { patcher: createMainPatcher() };
fs.writeFileSync(target, `${JSON.stringify(document, null, 2)}\n`);
fs.writeFileSync(voiceTarget, `${JSON.stringify({ patcher: createSynthVoicePatcher() }, null, 2)}\n`);
console.log(`Built ${path.relative(root, target)}`);
console.log(`Built ${path.relative(root, voiceTarget)}`);
