#!/usr/bin/env node

/* Render a lightweight Presentation Mode layout preview without requiring Max. */

const fs = require("fs");
const path = require("path");
const sharp = require("sharp");

const root = path.resolve(__dirname, "..");
const patch = JSON.parse(fs.readFileSync(path.join(root, "max", "WebernPersona.maxpat"), "utf8"));
const boxes = patch.patcher.boxes.map((entry) => entry.box).filter((box) => box.presentation === 1);
const width = 1440;
const height = 940;

function escapeXml(value) {
    return String(value)
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;");
}

function color(value, fallback) {
    if (!Array.isArray(value)) return fallback;
    return `rgb(${Math.round(value[0] * 255)},${Math.round(value[1] * 255)},${Math.round(value[2] * 255)})`;
}

function rect(box) {
    return box.presentation_rect || box.patching_rect;
}

function renderFunction(box) {
    const [x, y, w, h] = rect(box);
    const points = box.addpoints || [];
    const domain = points.length >= 2 ? Math.max(...points.filter((_, index) => index % 3 === 0)) : 1000;
    const pairs = [];
    for (let i = 0; i < points.length; i += 3) {
        pairs.push(`${x + (points[i] / domain) * w},${y + h - points[i + 1] * h}`);
    }
    return [
        `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="5" fill="#14171c" stroke="#353b47"/>`,
        `<polyline points="${pairs.join(" ")}" fill="none" stroke="${color(box.linecolor, "#4c89ba")}" stroke-width="3"/>`,
        ...pairs.map((pair) => {
            const [cx, cy] = pair.split(",");
            return `<circle cx="${cx}" cy="${cy}" r="5" fill="#f6f6f4"/>`;
        })
    ].join("");
}

function renderScore(box) {
    const [x, y, w, h] = rect(box);
    const names = box.voicenames || [];
    const top = y + 20;
    const staffGap = (h - 38) / 10;
    let svg = `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="4" fill="#fbfbf7" stroke="#464b54"/>`;
    for (let voice = 0; voice < 10; voice++) {
        const staffY = top + voice * staffGap;
        svg += `<text x="${x + 12}" y="${staffY + 12}" fill="#353535" font-size="10" font-family="Arial">${escapeXml(names[voice] || `Voice ${voice + 1}`)}</text>`;
        for (let line = 0; line < 5; line++) {
            const lineY = staffY + line * 3;
            svg += `<line x1="${x + 92}" y1="${lineY}" x2="${x + w - 14}" y2="${lineY}" stroke="#777" stroke-width="0.65"/>`;
        }
    }
    return svg;
}

function renderBox(box) {
    const [x, y, w, h] = rect(box);
    if (box.maxclass === "panel") {
        return `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="12" fill="#1b1e24" stroke="#353b47"/>`;
    }
    if (box.maxclass === "comment") {
        return `<text x="${x}" y="${y + (box.fontsize || 12) + 1}" fill="${color(box.textcolor, "#f0f0f0")}" font-size="${box.fontsize || 12}" font-weight="${box.fontface ? 700 : 400}" font-family="Arial">${escapeXml(box.text)}</text>`;
    }
    if (box.maxclass === "function") return renderFunction(box);
    if (box.maxclass === "bach.score") return renderScore(box);
    if (box.maxclass === "textbutton") {
        return `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="8" fill="${color(box.bgcolor, "#85501e")}"/><text x="${x + w / 2}" y="${y + h / 2 + 5}" fill="#fff" text-anchor="middle" font-size="${box.fontsize || 12}" font-weight="700" font-family="Arial">${escapeXml(box.text)}</text>`;
    }
    if (box.maxclass === "umenu" || box.maxclass === "number" || box.maxclass === "flonum" || box.maxclass === "message") {
        const defaults = {
            "density-number": "0.45",
            "coherence-number": "0.78",
            "metamorphosis-number": "0.62",
            "contrast-number": "0.72",
            "symmetry-number": "0.68",
            "silence-number": "0.55",
            "lyricism-number": "0.8"
        };
        const value = box.id === "profile-menu" ? "Op.10 synthesis" : (
            box.text || defaults[box.id] ||
            (box.id === "seed-number" ? "1913" : box.id === "event-number" ? "25" : box.id === "tempo-number" ? "60" : "")
        );
        return `<rect x="${x}" y="${y}" width="${w}" height="${h}" rx="4" fill="#292c33" stroke="#3a404b"/><text x="${x + 8}" y="${y + h / 2 + 4}" fill="#eef0f4" font-size="11" font-family="Arial">${escapeXml(value)}</text>`;
    }
    return "";
}

const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}">
<rect width="${width}" height="${height}" fill="#0e1013"/>
${boxes.map(renderBox).join("\n")}
</svg>`;

const svgPath = path.join(root, "docs", "webernPersona-ui-preview.svg");
const pngPath = path.join(root, "docs", "webernPersona-ui-preview.png");
fs.writeFileSync(svgPath, svg);
sharp(Buffer.from(svg)).png().toFile(pngPath).then(() => {
    console.log(`Rendered ${path.relative(root, pngPath)}`);
});
