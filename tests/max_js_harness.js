const assert = require("assert");
const fs = require("fs");
const path = require("path");
const vm = require("vm");

const root = path.resolve(__dirname, "..");

function plain(value) {
    return JSON.parse(JSON.stringify(value));
}

function loadEngine() {
    const outputs = [];
    const posts = [];
    const context = {
        inlet: 0,
        outlet(index, ...atoms) {
            outputs.push({ index, atoms: plain(atoms) });
        },
        post(...atoms) {
            posts.push(atoms.join(""));
        },
        arrayfromargs(args) {
            return Array.prototype.slice.call(args);
        }
    };

    vm.createContext(context);
    const filename = path.join(root, "max", "webernPersonaEngine.js");
    vm.runInContext(fs.readFileSync(filename, "utf8"), context, { filename });
    context.profiles = plain(JSON.parse(
        fs.readFileSync(path.join(root, "max", "webern_persona_profiles.json"), "utf8")
    ).profiles);
    return { context, outputs, posts };
}

function configureAndGenerate(engine, seed = 1913, profile = 1, count = 25) {
    engine.outputs.length = 0;
    engine.context.seed(seed);
    engine.context.profile(profile);
    engine.context.eventcount(count);
    engine.context.tempo(60);
    engine.context.density(0.45);
    engine.context.coherence(0.78);
    engine.context.metamorphosis(0.62);
    engine.context.timbralcontrast(0.72);
    engine.context.symmetry(0.68);
    engine.context.silence(0.55);
    engine.context.lyricism(0.8);
    engine.context.activity(0, 0.2, 420, 0.55, 720, 0.35, 1000, 0.18);
    engine.context.dynamics(0, 0.12, 550, 0.65, 1000, 0.16);
    engine.context.generate();

    const row = engine.outputs.find((entry) => entry.index === 1).atoms[0];
    const chords = engine.outputs
        .filter((entry) => entry.index === 0 && entry.atoms[0][0] === "addchord")
        .map((entry) => entry.atoms[0]);
    return { row, chords };
}

function testRowAndEvents() {
    const engine = loadEngine();
    const first = configureAndGenerate(engine, 1913, 1, 25);
    const second = configureAndGenerate(engine, 1913, 1, 25);

    assert.deepStrictEqual(first, second, "same seed and controls must reproduce the complete sketch");
    assert.strictEqual(first.row.length, 12);
    assert.strictEqual(new Set(first.row).size, 12, "the generated row must contain twelve unique pitch classes");
    assert.strictEqual(first.chords.length, 25);

    const voices = first.chords.map((command) => command[1]);
    assert(voices.every((voice) => voice >= 1 && voice <= 10));
    assert(new Set(voices).size >= 5, "timbral polychromy should use several instruments");

    const onsets = first.chords.map((command) => command[3]);
    for (let i = 1; i < onsets.length; i++) {
        assert(onsets[i] >= onsets[i - 1], "global onsets must be ordered");
    }
    assert(first.chords.every((command) => command[6] > 0), "all durations must be positive");

    const firstPitchClass = ((first.chords[0][5] / 100) % 12 + 12) % 12;
    const lastPitchClass = ((first.chords[first.chords.length - 1][5] / 100) % 12 + 12) % 12;
    assert.strictEqual(firstPitchClass, 11, "op.10/I begins from the B/H central area");
    assert.strictEqual(lastPitchClass, 5, "op.10/I closes on F in the Reutter profile");
}

function testDifferentSeed() {
    const engine = loadEngine();
    const first = configureAndGenerate(engine, 1913, 0, 25);
    const second = configureAndGenerate(engine, 1945, 0, 25);
    assert.notDeepStrictEqual(first.row, second.row, "different seeds should produce different rows");
}

function testFreshRowOnEveryGenerate() {
    const engine = loadEngine();
    const first = configureAndGenerate(engine, 1913, 0, 25);
    engine.outputs.length = 0;
    engine.context.generate();
    const secondRow = engine.outputs.find((entry) => entry.index === 1).atoms[0];
    assert.notDeepStrictEqual(first.row, secondRow, "Generate Material must advance to a fresh twelve-tone row");

    engine.context.seed(1913);
    engine.outputs.length = 0;
    engine.context.generate();
    const replayRow = engine.outputs.find((entry) => entry.index === 1).atoms[0];
    assert.deepStrictEqual(first.row, replayRow, "re-entering the seed must replay generation 1");
}

function testScoreDecoration() {
    const engine = loadEngine();
    configureAndGenerate(engine, 1913, 2, 48);
    engine.outputs.length = 0;
    engine.context.decorate();

    const commands = engine.outputs
        .filter((entry) => entry.index === 3)
        .map((entry) => entry.atoms[0]);
    const selections = commands.filter((command) => command[0] === "sel");
    const dynamics = commands.filter((command) => command[0] === "setslot" && command[2] === 20);
    const articulations = commands.filter((command) => command[0] === "setslot" && command[2] === 22);
    const annotations = commands.filter((command) => command[0] === "setslot" && command[2] === 24);
    const tempi = commands.filter((command) => command[0] === "addtempo");

    assert(dynamics.length > 0, "dynamics must be written to slot 20");
    assert(articulations.length > 0, "articulations must be written to slot 22");
    assert(annotations.length > 0, "character and technique text must be written to annotation slot 24");
    assert(tempi.length >= 3, "movement-specific tempo changes must be added to bach.score");
    assert(selections.length >= dynamics.length + articulations.length + annotations.length);
    assert(selections.every((command) => command.includes("@tiemode") && command.includes("@skiprests")));
    assert(
        dynamics.some((command) => /[<>]/.test(String(command[3]))),
        "at least one dynamic token should create a hairpin"
    );
}

function testRegisterDisciplineAndMicroPhrases() {
    const engine = loadEngine();
    configureAndGenerate(engine, 808, 1, 96);
    const events = plain(engine.context.generatedEvents);
    const instruments = plain(engine.context.INSTRUMENTS);
    let outsideComfort = 0;
    for (const event of events) {
        const instrument = instruments[event.voice - 1];
        const midi = event.pitchCents / 100;
        assert(midi >= instrument.low && midi <= instrument.high, `${instrument.name} must stay in its playable range`);
        if (midi < instrument.comfortLow || midi > instrument.comfortHigh) {
            outsideComfort++;
        }
    }
    assert(outsideComfort <= Math.ceil(events.length * 0.1), "quiet profile I should overwhelmingly stay in comfortable registers");
    assert(
        events.slice(1).some((event, index) =>
            event.groupIndex === events[index].groupIndex && event.voice === events[index].voice
        ),
        "a temporary instrumental focus must sometimes sustain a multi-note micro-phrase"
    );
    assert(events.some((event) => ["solo-line", "exchange", "echo"].includes(event.groupTexture)));
}

function testMovementIdentityAndPedalField() {
    const movementEvents = [];
    for (let profile = 1; profile <= 5; profile++) {
        const engine = loadEngine();
        configureAndGenerate(engine, 303, profile, 72);
        movementEvents[profile] = plain(engine.context.generatedEvents);
    }
    const syncCount = (events) => events.filter((event) => event.synchronized).length;
    assert(syncCount(movementEvents[2]) > syncCount(movementEvents[1]), "movement II must form more shared-rhythm blocks than I");

    const pedals = movementEvents[3].filter((event) => event.groupTexture === "pedal-tremolo");
    assert(pedals.length >= 6, "movement III must contain a substantial tremolo-pedal field");
    assert(new Set(pedals.map((event) => event.voice)).size >= 3, "the pedal field must combine several instruments");
    assert(new Set(pedals.map((event) => event.pitchClass)).size === 1, "the pedal field must share its focal pitch class");
    assert(pedals.every((event) => event.articulation === "tremolo1" || event.articulation === "trill"));

    const endings = movementEvents.slice(1).map((events) =>
        Math.max(...events.map((event) => event.onsetBeats + event.durationBeats))
    );
    assert(new Set(endings.map((value) => Math.round(value))).size >= 4, "the five movement forms must have distinct temporal silhouettes");
}

function testDynamicsAxisIsAuthoritative() {
    const engine = loadEngine();
    configureAndGenerate(engine, 91, 0, 25);
    engine.context.dynamics(0, 0, 1000, 1);
    engine.context.seed(91);
    engine.context.generate();
    const events = plain(engine.context.generatedEvents);
    assert.strictEqual(events[0].dynamicLevel, 0, "bottom of Dynamics must mean pppp");
    assert.strictEqual(events[events.length - 1].dynamicLevel, 8, "top of Dynamics must mean fff");
}

function testSingleEvent() {
    const engine = loadEngine();
    const result = configureAndGenerate(engine, 1, 0, 1);
    assert.strictEqual(result.chords.length, 1);
    assert(Number.isFinite(result.chords[0][3]));
    assert(Number.isFinite(result.chords[0][6]));
}

function testPersonaDecisionModel() {
    const engine = loadEngine();
    configureAndGenerate(engine, 1913, 1, 37);
    const events = plain(engine.context.generatedEvents);

    assert(events.every((event) => typeof event.decisionReason === "string" && event.decisionReason.length > 0));
    assert(events.some((event) => event.groupPosition > 0), "events must be organized into motivic groups");
    assert(events.some((event) => event.mirrorOf >= 0), "profile I should create displaced formal-axis partners");
    assert(events.some((event) => event.role === "axis"), "formal roles must include an axis event");

    const postsBefore = engine.posts.length;
    engine.context.trace();
    assert(engine.posts.length > postsBefore, "decision trace must be printable in the Max Console");
}

function testSilenceControl() {
    const compactEngine = loadEngine();
    configureAndGenerate(compactEngine, 22, 0, 25);
    compactEngine.context.silence(0);
    compactEngine.outputs.length = 0;
    compactEngine.context.generate();
    const compact = compactEngine.outputs
        .filter((entry) => entry.index === 0 && entry.atoms[0][0] === "addchord")
        .map((entry) => entry.atoms[0]);

    const spaciousEngine = loadEngine();
    configureAndGenerate(spaciousEngine, 22, 0, 25);
    spaciousEngine.context.silence(1);
    spaciousEngine.outputs.length = 0;
    spaciousEngine.context.generate();
    const spacious = spaciousEngine.outputs
        .filter((entry) => entry.index === 0 && entry.atoms[0][0] === "addchord")
        .map((entry) => entry.atoms[0]);

    assert(spacious[spacious.length - 1][3] > compact[compact.length - 1][3]);
}

testRowAndEvents();
testDifferentSeed();
testFreshRowOnEveryGenerate();
testScoreDecoration();
testSingleEvent();
testPersonaDecisionModel();
testSilenceControl();
testRegisterDisciplineAndMicroPhrases();
testMovementIdentityAndPedalField();
testDynamicsAxisIsAuthoritative();
console.log("webernPersonaEngine Max-JS harness: all tests passed");
