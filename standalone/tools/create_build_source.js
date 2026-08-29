#!/usr/bin/env node

/*
 * Creates the isolated Max standalone source without modifying the research
 * patch. Copyright (c) Dmitrii Shchukin 2026.
 */

"use strict";

const fs = require("fs");
const path = require("path");
const crypto = require("crypto");

const repositoryRoot = path.resolve(__dirname, "..", "..");
const sourceRoot = path.join(repositoryRoot, "max");
const standaloneRoot = path.join(repositoryRoot, "standalone");
const outputRoots = [
    path.join(standaloneRoot, "build-source"),
    path.join(standaloneRoot, "macos", "build-source"),
    path.join(standaloneRoot, "windows", "build-source")
];

const sourcePatchPath = path.join(sourceRoot, "WebernPersona.maxpat");

const copiedFiles = [
    "WebernVoice.maxpat",
    "webernPersonaEngine.js",
    "webern_persona_profiles.json"
];

function sha256(filePath) {
    return crypto.createHash("sha256").update(fs.readFileSync(filePath)).digest("hex");
}

function copy(source, destination) {
    fs.copyFileSync(source, destination);
}

function buildStandalonePatch(outputRoot) {
    const sourceHashBefore = sha256(sourcePatchPath);
    const document = JSON.parse(fs.readFileSync(sourcePatchPath, "utf8"));
    const patcher = document.patcher;
    const outputPatchPath = path.join(outputRoot, "WebernCompositionalModel.maxpat");

    patcher.description = "Computational Modeling of Webern's Op. 10 - standalone application - Copyright (c) Dmitrii Shchukin 2026";
    patcher.toolbarvisible = 0;
    patcher.statusbarvisible = 0;
    patcher.bglocked = 1;
    patcher.openinpresentation = 1;

    const alreadyConfigured = patcher.boxes.some((entry) => entry.box && entry.box.id === "standalone-config");
    if (!alreadyConfigured) {
        patcher.boxes.push({
            box: {
                id: "standalone-config",
                maxclass: "newobj",
                text: "standalone @bundleidentifier com.dmitriishchukin.weberncompositionalmodel @cantclosetoplevelpatchers 0 @cefsupport 0 @copysupport 1 @database 0 @gensupport 0 @noloadbangdefeating 1 @searchformissingfiles 0 @statusvisible 0 @usesearchpath 0 @preffilename WebernCompositionalModel",
                hidden: 1,
                numinlets: 0,
                numoutlets: 0,
                patching_rect: [30, 1100, 720, 22]
            }
        });
    }

    fs.writeFileSync(outputPatchPath, `${JSON.stringify(document, null, 2)}\n`, "utf8");

    const sourceHashAfter = sha256(sourcePatchPath);
    if (sourceHashBefore !== sourceHashAfter) {
        throw new Error("The original Max patch changed during standalone generation.");
    }
}

function main() {
    for (const outputRoot of outputRoots) {
        fs.mkdirSync(outputRoot, { recursive: true });
        buildStandalonePatch(outputRoot);

        for (const fileName of copiedFiles) {
            copy(path.join(sourceRoot, fileName), path.join(outputRoot, fileName));
        }

        copy(
            path.join(standaloneRoot, "legal", "STANDALONE_LICENSE.txt"),
            path.join(outputRoot, "STANDALONE_LICENSE.txt")
        );
        copy(
            path.join(standaloneRoot, "legal", "THIRD_PARTY_NOTICES.txt"),
            path.join(outputRoot, "THIRD_PARTY_NOTICES.txt")
        );

        process.stdout.write(`Standalone build source created at ${outputRoot}\n`);
    }
}

main();
