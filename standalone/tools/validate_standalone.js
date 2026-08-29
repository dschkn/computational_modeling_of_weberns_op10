#!/usr/bin/env node

/* Copyright (c) Dmitrii Shchukin 2026 */

"use strict";

const fs = require("fs");
const path = require("path");
const crypto = require("crypto");

const root = path.resolve(__dirname, "..", "..");
const buildSources = [
    path.join(root, "standalone", "build-source"),
    path.join(root, "standalone", "macos", "build-source"),
    path.join(root, "standalone", "windows", "build-source")
];

function assert(condition, message) {
    if (!condition) {
        throw new Error(message);
    }
}

function hash(filePath) {
    return crypto.createHash("sha256").update(fs.readFileSync(filePath)).digest("hex");
}

function validateCopiedFiles(buildSource) {
    for (const fileName of [
        "WebernVoice.maxpat",
        "webernPersonaEngine.js",
        "webern_persona_profiles.json"
    ]) {
        assert(
            hash(path.join(root, "max", fileName)) === hash(path.join(buildSource, fileName)),
            `${fileName} is not an exact copy of the research source.`
        );
    }
}

function validatePatch(buildSource) {
    const document = JSON.parse(fs.readFileSync(path.join(buildSource, "WebernCompositionalModel.maxpat"), "utf8"));
    const patcher = document.patcher;
    const config = patcher.boxes.find((entry) => entry.box && entry.box.id === "standalone-config");
    const text = config && config.box.text;

    assert(config, "The hidden standalone configuration object is missing.");
    assert(config.box.hidden === 1, "The standalone configuration must remain hidden.");
    assert(/@searchformissingfiles 0/.test(text), "External search must be disabled.");
    assert(/@usesearchpath 0/.test(text), "The user search path must be disabled.");
    assert(/@copysupport 1/.test(text), "Max runtime support must be copied.");
    assert(patcher.openinpresentation === 1, "The application must open in Presentation Mode.");
    assert(patcher.toolbarvisible === 0, "The Max editing toolbar must be hidden.");

    const dependencyNames = new Set((patcher.dependency_cache || []).map((item) => item.name));
    for (const required of [
        "webernPersonaEngine.js",
        "WebernVoice.maxpat",
        "webern_persona_profiles.json",
        "bach.roll.mxo",
        "bach.score.mxo",
        "bach.quantize.mxo",
        "bach.playkeys.mxo",
        "bach.join.mxo"
    ]) {
        assert(dependencyNames.has(required), `Missing dependency-cache entry: ${required}`);
    }
}

function validateDocumentation() {
    for (const fileName of [
        "USER_GUIDE_EN.pdf",
        "BENUTZERHANDBUCH_DE.pdf",
        "RUKOVODSTVO_RU.pdf"
    ]) {
        const filePath = path.join(root, "standalone", "guides", fileName);
        assert(fs.existsSync(filePath), `Missing user guide: ${fileName}`);
        assert(fs.statSync(filePath).size > 10_000, `User guide is unexpectedly small: ${fileName}`);
    }
}

for (const buildSource of buildSources) {
    validateCopiedFiles(buildSource);
    validatePatch(buildSource);
}
validateDocumentation();
for (const platform of ["macos", "windows"]) {
    assert(
        fs.existsSync(path.join(root, "standalone", platform, "README.md")),
        `Missing ${platform} build instructions.`
    );
    assert(
        fs.existsSync(path.join(root, "standalone", platform, "release", "BUILD_OUTPUT_GOES_HERE.md")),
        `Missing ${platform} release lane.`
    );
}
process.stdout.write("Shared, macOS and Windows sources, dependencies, and user guides validated.\n");
