#!/usr/bin/env node

/*
 * Lightweight smoke test for a MusicXML file exported by bach.score.
 * It deliberately has no package dependencies so it can run next to Max.
 */

const fs = require("fs");
const path = require("path");

const input = process.argv[2];
if (!input) {
    console.error("Usage: node tools/check_musicxml.js path/to/export.musicxml");
    process.exit(2);
}

const resolved = path.resolve(input);
if (!fs.existsSync(resolved)) {
    console.error(`MusicXML file not found: ${resolved}`);
    process.exit(2);
}

const xml = fs.readFileSync(resolved, "utf8");

function count(pattern) {
    return (xml.match(pattern) || []).length;
}

const stats = {
    parts: count(/<score-part\b/g),
    notes: count(/<note\b/g),
    dynamics: count(/<dynamics\b/g),
    crescendoWedges: count(/<wedge\b[^>]*type=["']crescendo["']/g),
    diminuendoWedges: count(/<wedge\b[^>]*type=["'](?:diminuendo|decrescendo)["']/g),
    stopWedges: count(/<wedge\b[^>]*type=["']stop["']/g),
    articulations: count(/<articulations\b/g),
    ornaments: count(/<ornaments\b/g),
    textDirections: count(/<words\b/g),
    tempi: count(/<metronome\b/g) + count(/<sound\b[^>]*tempo=/g),
    ties: count(/<(?:tie|tied)\b/g),
    slurs: count(/<slur\b/g)
};

const errors = [];
if (!/<score-partwise\b/.test(xml) && !/<score-timewise\b/.test(xml)) {
    errors.push("not a score-partwise or score-timewise MusicXML document");
}
if (stats.parts === 0) {
    errors.push("no score parts found");
}
if (stats.notes === 0) {
    errors.push("no notes found");
}
if (stats.dynamics === 0) {
    errors.push("no <dynamics> elements found");
}
if (stats.crescendoWedges + stats.diminuendoWedges === 0) {
    errors.push("no crescendo or diminuendo <wedge> elements found");
}
if (stats.textDirections === 0) {
    errors.push("no text directions exported from annotation slot 24");
}
if (stats.tempi === 0) {
    errors.push("no tempo direction or sound tempo found");
}

console.log(JSON.stringify(stats, null, 2));

if (errors.length > 0) {
    console.error(`MusicXML check failed: ${errors.join("; ")}`);
    process.exit(1);
}

console.log("MusicXML dynamics and hairpins: present");
console.log("MusicXML tempo and annotation directions: present");
if (stats.articulations + stats.ornaments === 0) {
    console.warn("MusicXML warning: no articulation or ornament containers found");
} else {
    console.log("MusicXML articulations or ornaments: present");
}
