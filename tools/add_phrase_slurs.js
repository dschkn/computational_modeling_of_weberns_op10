#!/usr/bin/env node

/*
 * Converts hidden slot-25 phrase boundary directions exported by bach.score
 * into standard MusicXML <slur> notations.  bach 0.8.2 draws/exports internal
 * slurs but exposes no public message for creating them, so the Max engine
 * writes stable boundary tokens and this lossless post-export pass completes
 * the notation.
 */

const fs = require("fs");
const path = require("path");

const input = process.argv[2];
const output = process.argv[3];
if (!input) {
    console.error("Usage: node tools/add_phrase_slurs.js input.musicxml [output.musicxml]");
    process.exit(2);
}

const source = path.resolve(input);
const target = path.resolve(output || input.replace(/(\.musicxml|\.xml)?$/i, "-with-slurs.musicxml"));
if (!fs.existsSync(source)) {
    console.error(`MusicXML file not found: ${source}`);
    process.exit(2);
}

let xml = fs.readFileSync(source, "utf8");
const marker = /<direction\b[\s\S]*?<words>\s*__WEBERN_SLUR_(START|STOP)_(\d+)\s*<\/words>[\s\S]*?<\/direction>\s*/i;
let converted = 0;

while (true) {
    const match = marker.exec(xml);
    if (!match) break;
    const type = match[1].toLowerCase();
    const number = 1 + ((Number(match[2]) - 1) % 6);
    const markerStart = match.index;
    xml = xml.slice(0, markerStart) + xml.slice(markerStart + match[0].length);

    const noteOpen = xml.indexOf("<note", markerStart);
    const noteClose = noteOpen < 0 ? -1 : xml.indexOf("</note>", noteOpen);
    if (noteOpen < 0 || noteClose < 0) {
        console.error(`No note follows phrase marker ${match[2]}`);
        process.exit(1);
    }

    const closeEnd = noteClose + "</note>".length;
    let note = xml.slice(noteOpen, closeEnd);
    const slur = `<slur type="${type}" number="${number}"/>`;
    if (/<notations\b[^>]*>/.test(note)) {
        note = note.replace(/<\/notations>/, `${slur}</notations>`);
    } else {
        note = note.replace(/<\/note>/, `<notations>${slur}</notations></note>`);
    }
    xml = xml.slice(0, noteOpen) + note + xml.slice(closeEnd);
    converted++;
}

fs.writeFileSync(target, xml);
console.log(`Added ${converted} phrase-slur boundaries: ${target}`);

