#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const childProcess = require("child_process");

const root = path.resolve(__dirname, "..");
const patchPath = path.join(root, "max", "WebernPersona.maxpat");

childProcess.execFileSync(process.execPath, [path.join(root, "tools", "build_patch.js")], {
    stdio: "inherit"
});

childProcess.execFileSync(process.execPath, ["--check", path.join(root, "max", "webernPersonaEngine.js")], {
    stdio: "inherit"
});

const patch = JSON.parse(fs.readFileSync(patchPath, "utf8"));

function validatePatcher(patcher, label) {
    const ids = patcher.boxes.map((entry) => entry.box.id);
    const idSet = new Set(ids);
    if (ids.length !== idSet.size) {
        throw new Error(`Duplicate Max object IDs detected in ${label}`);
    }

    for (const lineWrapper of patcher.lines) {
        const line = lineWrapper.patchline;
        if (!idSet.has(line.source[0])) {
            throw new Error(`Unknown patchline source ${line.source[0]} in ${label}`);
        }
        if (!idSet.has(line.destination[0])) {
            throw new Error(`Unknown patchline destination ${line.destination[0]} in ${label}`);
        }
    }

    for (const entry of patcher.boxes) {
        if (entry.box.patcher) {
            validatePatcher(entry.box.patcher, `${label}/${entry.box.id}`);
        }
    }
}

validatePatcher(patch.patcher, "root");

if (patch.patcher.openinpresentation !== 1) {
    throw new Error("Main patch must open in Presentation Mode");
}

const allBoxes = [];
function collectBoxes(patcher) {
    for (const entry of patcher.boxes) {
        allBoxes.push(entry.box);
        if (entry.box.patcher) {
            collectBoxes(entry.box.patcher);
        }
    }
}
collectBoxes(patch.patcher);

const scoreBoxes = allBoxes.filter((box) => box.maxclass === "bach.score");
const rollBoxes = allBoxes.filter((box) => box.maxclass === "bach.roll");
const quantizers = allBoxes.filter((box) => box.text && box.text.startsWith("bach.quantize"));
const engines = allBoxes.filter((box) => box.text === "js webernPersonaEngine.js");

if (scoreBoxes.length !== 1 || rollBoxes.length !== 1 || quantizers.length !== 1 || engines.length !== 1) {
    throw new Error("Expected exactly one score, one roll, one quantizer and one JS engine");
}
if (scoreBoxes[0].numvoices !== 10) {
    throw new Error("bach.score must contain ten voices");
}
if (scoreBoxes[0].versionnumber !== 80200 || rollBoxes[0].versionnumber !== 80200) {
    throw new Error("bach notation objects must retain the bach 0.8.2-compatible save format");
}
if (scoreBoxes[0].linkdynamicstoslot !== 20 || scoreBoxes[0].linkarticulationstoslot !== 22 ||
        scoreBoxes[0].linkannotationtoslot !== 24) {
    throw new Error("bach.score slot linkage is not explicit");
}
if (scoreBoxes[0].thinannotations !== 1) {
    throw new Error("bach.score annotation thinning must be enabled");
}
if (scoreBoxes[0].vzoom < 95 || !Array.isArray(scoreBoxes[0].voicespacing) || scoreBoxes[0].voicespacing.length !== 11) {
    throw new Error("bach.score must use expanded vertical spacing for ten readable staves");
}

const coreBox = patch.patcher.boxes.map((entry) => entry.box).find((box) => box.id === "core");
const coreLines = coreBox.patcher.lines.map((entry) => entry.patchline);
const coreBoxes = Object.fromEntries(coreBox.patcher.boxes.map((entry) => [entry.box.id, entry.box]));

// Max assigns subpatcher outlets by their explicit index (and, when the index
// is absent, by horizontal position). A wrong order silently sends row pitch
// names such as "D" to bach.score and sends the native score llll to the
// status field. Keep both the indices and the visual left-to-right order fixed.
const semanticOutlets = [
    ["core-score-out", 1],
    ["core-row-out", 2],
    ["core-status-out", 3]
];
for (const [id, expectedIndex] of semanticOutlets) {
    if (!coreBoxes[id] || coreBoxes[id].maxclass !== "outlet" || coreBoxes[id].index !== expectedIndex) {
        throw new Error(`${id} must be subpatcher outlet ${expectedIndex}`);
    }
}
const outletXs = semanticOutlets.map(([id]) => coreBoxes[id].patching_rect[0]);
if (!(outletXs[0] < outletXs[1] && outletXs[1] < outletXs[2])) {
    throw new Error("Core outlets must remain score, row, status from left to right");
}

const rootLines = patch.patcher.lines.map((entry) => entry.patchline);
const rootBoxes = Object.fromEntries(patch.patcher.boxes.map((entry) => [entry.box.id, entry.box]));
const expectedCoreDestinations = ["score", "row-set", "status-set"];
for (let outlet = 0; outlet < expectedCoreDestinations.length; outlet++) {
    const destination = expectedCoreDestinations[outlet];
    const connected = rootLines.some((line) =>
        line.source[0] === "core" && line.source[1] === outlet &&
        line.destination[0] === destination && line.destination[1] === 0
    );
    if (!connected) {
        throw new Error(`Core outlet ${outlet + 1} must feed ${destination}`);
    }
}

if (!rootBoxes["build-refresh-trigger"] || rootBoxes["build-refresh-trigger"].text !== "t b b b b") {
    throw new Error("Build Score must own a four-stage refresh trigger");
}
const buildRefreshEdges = [
    ["build-button", 0, "build-refresh-trigger"],
    ["build-refresh-trigger", 3, "activity-listdump"],
    ["build-refresh-trigger", 2, "dynamics-listdump"],
    ["build-refresh-trigger", 1, "generate-message"],
    ["build-refresh-trigger", 0, "build-message"]
];
for (const [source, outlet, destination] of buildRefreshEdges) {
    if (!rootLines.some((line) => line.source[0] === source && line.source[1] === outlet && line.destination[0] === destination)) {
        throw new Error(`Missing ordered Build Score refresh edge ${source}:${outlet} -> ${destination}`);
    }
}
if (rootLines.some((line) => line.source[0] === "build-button" && line.destination[0] === "build-message")) {
    throw new Error("Build Score must never bypass curve capture and fresh generation");
}
if (!rootBoxes["export-message"] || !rootBoxes["export-message"].text.includes("@directionslots 24 25")) {
    throw new Error("MusicXML export must include annotation and phrase-boundary slots 24/25");
}
if (!rootBoxes["profile-select"] || rootBoxes["profile-select"].text !== "sel 0 1 2 3 4 5") {
    throw new Error("Movement selection must install six distinct UI presets");
}

const directQuantizeOutput = coreLines.find((line) =>
    line.source[0] === "core-quantize" && line.source[1] === 0 &&
    line.destination[0] === "core-score-out" && line.destination[1] === 0
);
if (!directQuantizeOutput || directQuantizeOutput.order !== 0) {
    throw new Error("bach.quantize native llll must reach bach.score directly and first");
}
const unsafeQuantizeConversion = coreLines.some((line) =>
    line.source[0] === "core-quantize" && line.destination[0] === "core-after-quantize"
);
if (unsafeQuantizeConversion) {
    throw new Error("Quantized native llll must not pass through a standard Max trigger/list conversion");
}

const serialized = JSON.stringify(patch);
const forbidden = ["/Users/", "Desktop/", "durs2", "randomWebern", "umlaufbahn", "webernDynamics", "summe.js"];
for (const token of forbidden) {
    if (serialized.includes(token)) {
        throw new Error(`Legacy or absolute-path token remains in patch: ${token}`);
    }
}

const localDependencies = (patch.patcher.dependency_cache || [])
    .filter((entry) => entry.patcherrelativepath === ".")
    .map((entry) => entry.name);

for (const dependency of localDependencies) {
    if (!fs.existsSync(path.join(root, "max", dependency))) {
        throw new Error(`Missing local dependency ${dependency}`);
    }
}

const profileDocument = JSON.parse(fs.readFileSync(path.join(root, "max", "webern_persona_profiles.json"), "utf8"));
if (!profileDocument.profiles || profileDocument.profiles.length !== 6) {
    throw new Error("Expected six research profiles");
}
if (profileDocument.schemaVersion !== 5) {
    throw new Error("Expected section-technique profile schema version 5");
}
for (const profile of profileDocument.profiles) {
    for (const field of ["baseTempo", "phraseSizes", "focusPersistence", "homorhythmProbability", "registerRisk", "tempoPlan"]) {
        if (profile[field] === undefined) {
            throw new Error(`Profile ${profile.id} is missing ${field}`);
        }
    }
}
if (profileDocument.profiles[3].pedalProbability < 0.4 || !profileDocument.profiles[3].pedalVoices) {
    throw new Error("Movement III must define a combined tremolo-pedal field");
}

childProcess.execFileSync(process.execPath, [path.join(root, "tests", "max_js_harness.js")], {
    stdio: "inherit"
});

childProcess.execFileSync(process.execPath, [
    path.join(root, "tools", "check_musicxml.js"),
    path.join(root, "tests", "fixtures", "score-with-dynamics.musicxml")
], { stdio: "inherit" });

const phraseOutput = path.join(root, "tmp", "validated-phrase-slurs.musicxml");
fs.mkdirSync(path.dirname(phraseOutput), { recursive: true });
childProcess.execFileSync(process.execPath, [
    path.join(root, "tools", "add_phrase_slurs.js"),
    path.join(root, "tests", "fixtures", "score-with-phrase-metadata.musicxml"),
    phraseOutput
], { stdio: "inherit" });
const phraseXml = fs.readFileSync(phraseOutput, "utf8");
if ((phraseXml.match(/<slur\b/g) || []).length !== 2 || /__WEBERN_SLUR_/.test(phraseXml)) {
    throw new Error("Phrase-slur MusicXML postprocessor did not convert both boundaries");
}

console.log("Patch graph, semantic outlet order, dependencies, profiles and engine: valid");
