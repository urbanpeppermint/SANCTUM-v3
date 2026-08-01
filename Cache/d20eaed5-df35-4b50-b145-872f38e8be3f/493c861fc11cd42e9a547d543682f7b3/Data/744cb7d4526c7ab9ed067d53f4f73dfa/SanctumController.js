"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SanctumController = void 0;
var __selfType = requireType("./SanctumController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable");
const BUTTONS_1 = require("../../../Packages/BUTTONS");
const SanctumData_1 = require("./SanctumData");
const SanctumServices_1 = require("./SanctumServices");
let SanctumController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var SanctumController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.textDisplay = this.textDisplay;
            this.image = this.image;
            this.spinner = this.spinner;
            this.voiceInstructions = this.voiceInstructions;
            this.breathingButton = this.breathingButton;
            this.acupressureButton = this.acupressureButton;
            this.manifestationButton = this.manifestationButton;
            this.vaultButton = this.vaultButton;
            this.startPracticeOnTap = this.startPracticeOnTap;
            this.rootChakraButton = this.rootChakraButton;
            this.sacralChakraButton = this.sacralChakraButton;
            this.solarPlexusChakraButton = this.solarPlexusChakraButton;
            this.heartChakraButton = this.heartChakraButton;
            this.throatChakraButton = this.throatChakraButton;
            this.thirdEyeChakraButton = this.thirdEyeChakraButton;
            this.crownChakraButton = this.crownChakraButton;
            this.customManifestIntent = this.customManifestIntent;
            this.saveVisionButton = this.saveVisionButton;
            this.vaultNextButton = this.vaultNextButton;
            this.vaultPrevButton = this.vaultPrevButton;
            this.audioManagerObject = this.audioManagerObject;
            this.gestureModule = require("LensStudio:GestureModule");
            this.activeMode = "idle";
            this.sessionCancelled = false;
            this.sessionId = 0;
            this.currentAudioComponent = null;
            this.hubUI = null;
            this.pendingStartName = "";
            this.pendingStartAction = null;
            this.pendingNavigateView = null;
            this.preloadedTextures = [];
            this.currentSessionPoints = [];
            this.vault = new SanctumServices_1.VisionVault();
            this.vaultBrowseIndex = 0;
            this.pendingVision = null;
            this.suggestionIndex = 0;
            this.lastGeneratedB64 = "";
            this.intentOverride = "";
            this.visionMaterialReady = false;
            this.asrModule = require("LensStudio:AsrModule");
        }
        __initialize() {
            super.__initialize();
            this.textDisplay = this.textDisplay;
            this.image = this.image;
            this.spinner = this.spinner;
            this.voiceInstructions = this.voiceInstructions;
            this.breathingButton = this.breathingButton;
            this.acupressureButton = this.acupressureButton;
            this.manifestationButton = this.manifestationButton;
            this.vaultButton = this.vaultButton;
            this.startPracticeOnTap = this.startPracticeOnTap;
            this.rootChakraButton = this.rootChakraButton;
            this.sacralChakraButton = this.sacralChakraButton;
            this.solarPlexusChakraButton = this.solarPlexusChakraButton;
            this.heartChakraButton = this.heartChakraButton;
            this.throatChakraButton = this.throatChakraButton;
            this.thirdEyeChakraButton = this.thirdEyeChakraButton;
            this.crownChakraButton = this.crownChakraButton;
            this.customManifestIntent = this.customManifestIntent;
            this.saveVisionButton = this.saveVisionButton;
            this.vaultNextButton = this.vaultNextButton;
            this.vaultPrevButton = this.vaultPrevButton;
            this.audioManagerObject = this.audioManagerObject;
            this.gestureModule = require("LensStudio:GestureModule");
            this.activeMode = "idle";
            this.sessionCancelled = false;
            this.sessionId = 0;
            this.currentAudioComponent = null;
            this.hubUI = null;
            this.pendingStartName = "";
            this.pendingStartAction = null;
            this.pendingNavigateView = null;
            this.preloadedTextures = [];
            this.currentSessionPoints = [];
            this.vault = new SanctumServices_1.VisionVault();
            this.vaultBrowseIndex = 0;
            this.pendingVision = null;
            this.suggestionIndex = 0;
            this.lastGeneratedB64 = "";
            this.intentOverride = "";
            this.visionMaterialReady = false;
            this.asrModule = require("LensStudio:AsrModule");
        }
        onAwake() {
            if (this.image) {
                this.prepareVisionMaterial(this.image);
                this.image.sceneObject.enabled = false;
            }
            if (this.spinner)
                this.spinner.enabled = false;
            this.bindButton(this.breathingButton, () => this.handleBreathingPressed());
            this.bindButton(this.acupressureButton, () => this.handleAcupressurePressed());
            this.bindButton(this.manifestationButton, () => this.handleManifestationPressed());
            this.bindButton(this.vaultButton, () => this.handleVaultPressed());
            this.bindButton(this.saveVisionButton, () => this.handleSaveVisionPressed());
            this.bindButton(this.vaultNextButton, () => this.handleVaultNext());
            this.bindButton(this.vaultPrevButton, () => this.handleVaultPrev());
            this.bindButton(this.rootChakraButton, () => this.handleChakraPressed(0));
            this.bindButton(this.sacralChakraButton, () => this.handleChakraPressed(1));
            this.bindButton(this.solarPlexusChakraButton, () => this.handleChakraPressed(2));
            this.bindButton(this.heartChakraButton, () => this.handleChakraPressed(3));
            this.bindButton(this.throatChakraButton, () => this.handleChakraPressed(4));
            this.bindButton(this.thirdEyeChakraButton, () => this.handleChakraPressed(5));
            this.bindButton(this.crownChakraButton, () => this.handleChakraPressed(6));
            if (global.deviceInfoSystem.isEditor()) {
                this.createEvent("TapEvent").bind(() => {
                    if (this.startPracticeOnTap)
                        this.handleBreathingPressed();
                });
            }
            else {
                this.gestureModule.getPinchDownEvent(GestureModule.HandType.Right).add(() => {
                    if (this.startPracticeOnTap)
                        this.handleBreathingPressed();
                });
            }
            if (this.textDisplay && this.textDisplay.sceneObject.name === "TextOutput") {
                this.textDisplay.sceneObject.enabled = false;
            }
        }
        /** Single status line — hub Status text and legacy TextOutput stay in sync. */
        setStatus(message) {
            if (!this.textDisplay)
                return;
            this.textDisplay.sceneObject.enabled = true;
            this.textDisplay.text = message;
        }
        bindButton(buttonObj, callback) {
            if (!buttonObj)
                return;
            const interactable = buttonObj.getComponent(Interactable_1.Interactable.getTypeName());
            if (!interactable)
                return;
            interactable.onInteractorTriggerEnd.add((_event) => callback());
        }
        /** Wire hub panel for menu navigation. */
        bindHubUI(ui) {
            this.hubUI = ui;
            this.suggestionIndex = 0;
            ui.setDesireIndex(0);
        }
        /** Wire the UIKit status line after the hub panel is built at runtime. */
        bindStatusText(text) {
            if (text)
                this.textDisplay = text;
        }
        /** @deprecated Use bindHubUI desireText */
        bindIntentPreview(text) {
            if (text && this.hubUI)
                this.hubUI.setDesirePreview(text.text);
        }
        /** Wire the spatial vision frame used by practices. */
        bindVisionImage(image) {
            if (image) {
                this.image = image;
                this.visionMaterialReady = false;
                this.prepareVisionMaterial(image);
                image.sceneObject.enabled = false;
            }
        }
        prepareVisionMaterial(image) {
            if (!image.mainMaterial) {
                print("[Sanctum] vision image has no material — skip prepare");
                return;
            }
            const mat = image.mainMaterial.clone();
            image.clearMaterials();
            image.mainMaterial = mat;
            mat.mainPass.baseColor = new vec4(1, 1, 1, 1);
            image.renderOrder = 999;
            image.stretchMode = StretchMode.Fit;
            this.visionMaterialReady = true;
        }
        /** Wire the UIKit intent preview line after the hub panel is built. */
        bindIntentPreviewLegacy(_text) {
            // handled by bindHubUI
        }
        tryStartSession(name, action) {
            const targetMode = SanctumController.START_MODE[name];
            if (this.activeMode !== "idle") {
                if (targetMode === this.activeMode)
                    return;
                if (this.pendingStartName === name && this.pendingStartAction) {
                    this.cancelActiveSession();
                    this.pendingStartName = "";
                    this.pendingStartAction = null;
                    action();
                    return;
                }
                this.pendingStartName = name;
                this.pendingStartAction = action;
                this.setStatus("Starting " + name + " will interrupt your " + this.activeMode + " session.\nTap Start again to confirm.");
                return;
            }
            this.pendingStartName = "";
            this.pendingStartAction = null;
            action();
        }
        hubViewLabel(view) {
            const labels = {
                breathing: "Breathing Practice",
                acupressure: "Acupressure",
                chakra: "Chakra Tuning",
                manifestation: "Manifestation",
                manifestList: "Manifestation",
                manifestVoice: "Manifestation",
            };
            return labels[view] ?? view;
        }
        hubNavigate(view) {
            if (view === "main") {
                this.pendingNavigateView = null;
                this.hubUI?.showView("main");
                return;
            }
            if (this.activeMode !== "idle") {
                if (this.pendingNavigateView === view) {
                    this.cancelActiveSession();
                    this.pendingNavigateView = null;
                    this.hubUI?.showView(view);
                    this.setStatus(this.hubViewLabel(view) + " ready.\nTap Start when you are.");
                    return;
                }
                this.pendingNavigateView = view;
                this.setStatus("Opening " + this.hubViewLabel(view) + " will interrupt your " + this.activeMode + " session.\nTap the menu item again to confirm.");
                return;
            }
            this.pendingNavigateView = null;
            this.hubUI?.showView(view);
        }
        hubBackToMain() {
            this.hubUI?.showView("main");
        }
        hubStartBreathing() {
            this.tryStartSession("Breathing", () => this.handleBreathingPressed());
        }
        hubStartAcupressure() {
            this.tryStartSession("Acupressure", () => this.handleAcupressurePressed());
        }
        hubStartChakra(index) {
            this.tryStartSession("Chakra Tuning", () => this.handleChakraPressed(index));
        }
        hubOpenManifestList() {
            this.hubUI?.setDesireIndex(this.suggestionIndex);
        }
        hubDesirePrev() {
            if (!this.hubUI)
                return;
            this.hubUI.setDesireIndex(this.hubUI.getDesireIndex() - 1);
            this.suggestionIndex = this.hubUI.getDesireIndex();
        }
        hubDesireNext() {
            if (!this.hubUI)
                return;
            this.hubUI.setDesireIndex(this.hubUI.getDesireIndex() + 1);
            this.suggestionIndex = this.hubUI.getDesireIndex();
        }
        hubDesireSelect() {
            this.suggestionIndex = this.hubUI?.getDesireIndex() ?? 0;
            this.intentOverride = "";
            this.setStatus("Selected: \"" + this.getCurrentManifestIntent() + "\"\nTap Generate Visualization.");
        }
        hubOpenManifestVoice() {
            this.intentOverride = "";
            this.setStatus("Tap Start Microphone and speak.\nOr use Type Instead.");
        }
        hubTypeIntent() {
            this.startTypeIntentInput();
        }
        hubBeginManifestation() {
            this.tryStartSession("Manifestation", () => this.handleManifestationPressed());
        }
        hubStartVoiceCapture() {
            this.startVoiceIntentInput();
        }
        getAudioManager() {
            if (!this.audioManagerObject)
                return null;
            return this.audioManagerObject.getComponent(BUTTONS_1.AudioButtonManager.getTypeName());
        }
        stopChakraAudio() {
            const mgr = this.getAudioManager();
            if (mgr)
                mgr.stopAllAudio();
        }
        cancelActiveSession() {
            this.sessionCancelled = true;
            this.sessionId++;
            this.activeMode = "idle";
            this.preloadedTextures = [];
            this.pendingVision = null;
            if (this.currentAudioComponent) {
                try {
                    this.currentAudioComponent.stop(true);
                }
                catch (_) { }
                this.currentAudioComponent = null;
            }
            this.stopChakraAudio();
            if (this.image)
                this.image.sceneObject.enabled = false;
            if (this.spinner)
                this.spinner.enabled = false;
            print("Active session cancelled — all buttons remain active");
        }
        /** Start a exclusive session; cancels any in-flight work from a prior session. */
        startSession(mode) {
            if (this.activeMode !== "idle") {
                this.cancelActiveSession();
            }
            this.sessionCancelled = false;
            this.sessionId++;
            this.activeMode = mode;
            return this.sessionId;
        }
        isSessionActive(sessionId) {
            return this.sessionId === sessionId && !this.sessionCancelled;
        }
        isCancelled() {
            return this.sessionCancelled;
        }
        showTexture(texture) {
            if (!this.image) {
                print("SanctumController: vision Image not wired");
                return;
            }
            if (!this.visionMaterialReady) {
                this.prepareVisionMaterial(this.image);
            }
            const pass = this.image.mainMaterial.mainPass;
            pass.baseTex = texture;
            pass.baseColor = new vec4(1, 1, 1, 1);
            this.image.renderOrder = 999;
            this.image.stretchMode = StretchMode.Fit;
            this.image.sceneObject.enabled = true;
            print("SanctumController: vision image displayed");
        }
        hideImage() {
            if (this.image)
                this.image.sceneObject.enabled = false;
        }
        setSpinner(enabled) {
            if (this.spinner)
                this.spinner.enabled = enabled;
        }
        playVoice(script) {
            SanctumServices_1.AIService.doVoiceGuidance(script, this.voiceInstructions, this, () => this.isCancelled(), (audio) => {
                this.currentAudioComponent = audio;
            });
        }
        delayedCallback(delayTime, callback) {
            const evt = this.createEvent("DelayedCallbackEvent");
            evt.bind(callback);
            evt.reset(delayTime);
        }
        playChakraAudio(chakraIndex) {
            const mgr = this.getAudioManager();
            if (mgr)
                mgr.playChakraTrack(chakraIndex);
        }
        // ─── Breathing ─────────────────────────────────────────
        handleBreathingPressed() {
            const session = this.startSession("breathing");
            this.setStatus("Preparing your breathing practice…");
            this.setSpinner(true);
            const prompt = SanctumData_1.BREATHING_IMAGE_PROMPTS[Math.floor(Math.random() * SanctumData_1.BREATHING_IMAGE_PROMPTS.length)];
            SanctumServices_1.AIService.generateTexture(prompt, () => !this.isSessionActive(session))
                .then((texture) => {
                if (!this.isSessionActive(session))
                    return;
                this.preloadedTextures = [texture];
                this.setSpinner(false);
                this.generateBreathingScriptAndStart(session);
            })
                .catch((error) => {
                print("Breathing image preload failed: " + error);
                this.setSpinner(false);
                if (!this.isSessionActive(session))
                    return;
                this.preloadedTextures = [];
                this.generateBreathingScriptAndStart(session);
            });
        }
        generateBreathingScriptAndStart(session) {
            const system = `You are a meditation guide creating a 1-minute breathing practice script.
Structure: brief welcome, 3 cycles inhale 4s hold 4s exhale 6s, brief closing.
Use calming language with pauses "..." and gentle counting. ~50-55 seconds total.`;
            SanctumServices_1.AIService.chatCompletion(system, "Create a calming 1-minute guided breathing practice.", () => !this.isSessionActive(session))
                .then((script) => {
                if (!this.isSessionActive(session))
                    return;
                const finalScript = script || this.getFallbackBreathingScript();
                if (this.preloadedTextures.length > 0)
                    this.showTexture(this.preloadedTextures[0]);
                this.setStatus("Follow the guided voice… breathe with the rhythm.");
                this.playVoice(finalScript);
                this.delayedCallback(55, () => {
                    if (!this.isSessionActive(session))
                        return;
                    this.setStatus("Practice complete. Notice how you feel.");
                    this.activeMode = "idle";
                    this.delayedCallback(6, () => {
                        if (this.activeMode === "idle")
                            this.hideImage();
                    });
                });
            })
                .catch(() => {
                if (!this.isSessionActive(session))
                    return;
                if (this.preloadedTextures.length > 0)
                    this.showTexture(this.preloadedTextures[0]);
                const fallback = this.getFallbackBreathingScript();
                this.setStatus("Follow the guided voice… breathe with the rhythm.");
                this.playVoice(fallback);
                this.delayedCallback(55, () => {
                    if (!this.isSessionActive(session))
                        return;
                    this.setStatus("Practice complete. Notice how you feel.");
                    this.activeMode = "idle";
                });
            });
        }
        getFallbackBreathingScript() {
            return `Welcome. Find a comfortable position and close your eyes if you wish.
Let's begin. Breathe in slowly through your nose... one... two... three... four.
Hold gently... one... two... three... four.
Now breathe out slowly through your mouth... one... two... three... four... five... six.
Again, breathe in... one... two... three... four.
Hold... one... two... three... four.
And release... one... two... three... four... five... six.
One more time. Breathe in deeply... one... two... three... four.
Hold this breath... one... two... three... four.
And let it all go... one... two... three... four... five... six.
Beautiful. Notice how calm your body feels. When you are ready, gently open your eyes.`;
        }
        // ─── Acupressure ───────────────────────────────────────
        handleAcupressurePressed() {
            const session = this.startSession("acupressure");
            this.setStatus("Preparing Acupressure Session…");
            this.setSpinner(true);
            const selected = this.getRandomPoints(3);
            this.currentSessionPoints = selected;
            this.preloadAcupressureImages(session, selected, 0, []);
        }
        preloadAcupressureImages(session, points, index, textures) {
            if (!this.isSessionActive(session))
                return;
            if (index >= points.length) {
                this.preloadedTextures = textures;
                this.setSpinner(false);
                this.startAcupressureSession(session);
                return;
            }
            this.setStatus("Preparing point " + (index + 1) + " of " + points.length + "…");
            SanctumServices_1.AIService.generateTexture(points[index].imagePrompt, () => !this.isSessionActive(session))
                .then((texture) => {
                if (!this.isSessionActive(session))
                    return;
                textures.push(texture);
                this.preloadAcupressureImages(session, points, index + 1, textures);
            })
                .catch(() => {
                textures.push(null);
                this.preloadAcupressureImages(session, points, index + 1, textures);
            });
        }
        startAcupressureSession(session) {
            const points = this.currentSessionPoints;
            const pointBlock = points
                .map((p, i) => `Point ${i + 1}: ${p.name}\n  Location: ${p.location}\n  Technique: ${p.instruction}`)
                .join("\n\n");
            const system = `You are a calming acupressure guide. Create a 2-minute guided session.
For each point (~35s): name, location, technique, breathing, benefit. Pauses with "..."\n\nPoints:\n${pointBlock}`;
            SanctumServices_1.AIService.chatCompletion(system, "Create a calming acupressure session for stress relief.", () => !this.isSessionActive(session))
                .then((script) => {
                if (!this.isSessionActive(session))
                    return;
                this.playVoice(script || this.getFallbackAcupressureScript());
                this.runAcupressureSequence(session, 0);
            })
                .catch(() => {
                if (!this.isSessionActive(session))
                    return;
                this.playVoice(this.getFallbackAcupressureScript());
                this.runAcupressureSequence(session, 0);
            });
        }
        getFallbackAcupressureScript() {
            this.currentSessionPoints = SanctumData_1.ACUPRESSURE_POINTS.slice(0, 3);
            return `Welcome to your stress-relief acupressure session. Take one deep breath in... and slowly let it out.
We will work through three powerful acupressure points to melt away tension.
First, He Gu, LI4. Find the fleshy web between your thumb and index finger. Pinch firmly... breathe deeply... and release.
Next, Nei Guan, PC6. Two finger-widths below the wrist crease... press firmly... breathe... and release.
Finally, Yin Tang. Between your eyebrows... gentle circles... breathe slowly... and release.
Take one final deep breath in... and let it all go.`;
        }
        getRandomPoints(count) {
            const shuffled = [...SanctumData_1.ACUPRESSURE_POINTS].sort(() => Math.random() - 0.5);
            return shuffled.slice(0, Math.min(count, shuffled.length));
        }
        runAcupressureSequence(session, index) {
            if (!this.isSessionActive(session))
                return;
            const points = this.currentSessionPoints;
            if (index >= points.length) {
                this.setStatus("Session complete. Notice how your body feels.");
                this.activeMode = "idle";
                this.delayedCallback(6, () => {
                    if (this.activeMode === "idle")
                        this.hideImage();
                });
                return;
            }
            const point = points[index];
            this.setStatus("Point " + (index + 1) + " of " + points.length + ": " + point.name + "\n" +
                point.location + "\n\n" + point.instruction);
            if (this.preloadedTextures[index]) {
                this.showTexture(this.preloadedTextures[index]);
            }
            else {
                this.hideImage();
            }
            this.delayedCallback(35, () => this.runAcupressureSequence(session, index + 1));
        }
        // ─── Chakra Tuning ─────────────────────────────────────
        handleChakraPressed(chakraIndex) {
            const session = this.startSession("chakra");
            const chakra = SanctumData_1.CHAKRAS[chakraIndex];
            const script = (0, SanctumData_1.buildChakraMeditationScript)(chakra);
            this.setStatus((0, SanctumData_1.buildChakraDisplayText)(chakra));
            this.hideImage();
            this.playChakraAudio(chakraIndex);
            this.playVoice(script);
            this.delayedCallback(50, () => {
                if (!this.isSessionActive(session))
                    return;
                this.setStatus(chakra.name + " balanced.\n" + chakra.affirmation);
                this.activeMode = "idle";
            });
        }
        getFallbackChakraScript(chakra) {
            return (0, SanctumData_1.buildChakraMeditationScript)(chakra);
        }
        // ─── Manifestation ─────────────────────────────────────
        getCurrentManifestIntent() {
            if (this.intentOverride && this.intentOverride.trim().length >= 3) {
                return this.intentOverride.trim();
            }
            if (this.customManifestIntent && this.customManifestIntent.trim().length >= 10) {
                return this.customManifestIntent.trim();
            }
            if (this.hubUI)
                return this.hubUI.getSelectedDesire();
            return SanctumData_1.MANIFESTATION_DESIRES[this.suggestionIndex % SanctumData_1.MANIFESTATION_DESIRES.length];
        }
        setManifestIntent(text) {
            this.intentOverride = text.trim();
            if (this.hubUI)
                this.hubUI.setDesirePreview(text.trim());
        }
        updateIntentPreview() {
            if (this.hubUI)
                this.hubUI.setDesirePreview(this.getCurrentManifestIntent());
        }
        /** On-device ASR for voice intent (Spectacles device; limited in editor preview). */
        startVoiceIntentInput() {
            print("[Sanctum] Voice capture requested");
            this.hubUI?.setMicActive(true);
            this.setStatus("Microphone active — speak now.");
            try {
                const options = AsrModule.AsrTranscriptionOptions.create();
                options.silenceUntilTerminationMs = 1500;
                options.mode = AsrModule.AsrMode.HighAccuracy;
                options.onTranscriptionUpdateEvent.add((event) => {
                    const partial = event.text ? event.text.trim() : "";
                    if (partial.length > 0) {
                        print("[Sanctum] ASR partial: \"" + partial + "\" final=" + event.isFinal);
                        this.hubUI?.setIntentPreview(partial);
                        this.setStatus("Listening…\n\"" + partial + "\"");
                    }
                    if (event.isFinal && partial.length >= 3) {
                        this.setManifestIntent(partial);
                        this.hubUI?.setMicActive(false);
                        this.setStatus("Intent captured.\n\"" + partial + "\"\nTap Generate Visualization.");
                        print("[Sanctum] ASR final intent: \"" + partial + "\"");
                        this.asrModule.stopTranscribing();
                    }
                });
                options.onTranscriptionErrorEvent.add((code) => {
                    print("[Sanctum] ASR error code: " + code);
                    this.hubUI?.setMicActive(false);
                    this.setStatus("Microphone unavailable in preview.\nUse Type Instead, or test on Spectacles.");
                });
                this.asrModule.startTranscribing(options);
                print("[Sanctum] ASR transcribing started");
            }
            catch (e) {
                print("[Sanctum] ASR start failed: " + e);
                this.hubUI?.setMicActive(false);
                this.setStatus("Microphone unavailable.\nUse Type Instead.");
            }
        }
        /** AR keyboard for typed manifestation intent (device; limited in preview). */
        startTypeIntentInput() {
            print("[Sanctum] Type intent input started");
            try {
                require("LensStudio:TextInputModule");
                const options = new TextInputSystem.KeyboardOptions();
                options.enablePreview = true;
                options.keyboardType = TextInputSystem.KeyboardType.Text;
                options.returnKeyType = TextInputSystem.ReturnKeyType.Done;
                options.onTextChanged = (text) => {
                    if (text && text.trim().length >= 3) {
                        this.setManifestIntent(text);
                    }
                };
                options.onReturnKeyPressed = () => {
                    global.textInputSystem.dismissKeyboard();
                    const intent = this.getCurrentManifestIntent();
                    this.setStatus("Intent set.\n\"" + intent + "\"\nTap Generate Visualization.");
                };
                options.onError = (_code, description) => {
                    print("[Sanctum] Keyboard error: " + description);
                    this.setStatus("Keyboard unavailable in preview.\nBrowse intentions from the list.");
                };
                global.textInputSystem.requestKeyboard(options);
                this.setStatus("Type your intention…\nPress Done when finished.");
            }
            catch (e) {
                print("[Sanctum] Keyboard failed: " + e);
                this.setStatus("Keyboard unavailable.\nBrowse intentions from the list.");
            }
        }
        handleManifestationPressed() {
            const intent = this.getCurrentManifestIntent();
            const session = this.startSession("manifestation");
            this.pendingVision = null;
            this.setStatus("Manifestation\n\n\"" + intent + "\"\n\nPainting your vision…");
            this.setSpinner(true);
            this.hideImage();
            (0, SanctumServices_1.validateManifestIntent)(intent, () => !this.isSessionActive(session))
                .then(({ summary, inScope }) => {
                if (!this.isSessionActive(session))
                    return;
                if (!inScope) {
                    this.setSpinner(false);
                    this.setStatus(SanctumServices_1.OUT_OF_SCOPE_REDIRECT + "\n\nPick another desire from the carousel.");
                    this.activeMode = "idle";
                    return;
                }
                const imagePrompt = (0, SanctumData_1.buildManifestationImagePrompt)(intent);
                SanctumServices_1.AIService.generateImage(imagePrompt, () => !this.isSessionActive(session))
                    .then(({ texture, b64 }) => {
                    if (!this.isSessionActive(session))
                        return;
                    this.lastGeneratedB64 = b64;
                    this.showTexture(texture);
                    this.setSpinner(false);
                    const entry = {
                        id: (0, SanctumServices_1.createVisionId)(),
                        createdAt: Date.now(),
                        intentText: intent,
                        scriptSummary: summary,
                        imageB64: b64,
                    };
                    this.pendingVision = { entry, texture };
                    this.activeMode = "idle";
                    this.setStatus("Your Vision\n\n\"" + intent + "\"\n\nTap Save · Vault to browse.");
                    const scriptSystem = (0, SanctumServices_1.buildManifestationScript)(intent, summary);
                    return SanctumServices_1.AIService.chatCompletion(scriptSystem, "Create the guided visualization script.", () => !this.isSessionActive(session))
                        .catch((err) => {
                        print("[Sanctum] Script chat failed, using fallback: " + err);
                        return "";
                    })
                        .then((script) => {
                        if (!this.isSessionActive(session))
                            return;
                        const finalScript = script || (0, SanctumServices_1.getManifestationFallbackScript)(intent, summary);
                        this.playVoice(finalScript);
                        this.delayedCallback(70, () => {
                            if (!this.isSessionActive(session))
                                return;
                            this.setStatus("Vision complete.\n\nSave to Vault · Shuffle for a new intent · or choose another practice.");
                            this.activeMode = "idle";
                        });
                    });
                })
                    .catch((error) => {
                    print("Manifestation error: " + error);
                    if (!this.isSessionActive(session))
                        return;
                    this.setSpinner(false);
                    this.setStatus("Image unavailable.\nHere is a gentle guide instead.");
                    this.playVoice((0, SanctumServices_1.getManifestationFallbackScript)(intent, summary));
                    this.activeMode = "idle";
                });
            })
                .catch(() => {
                if (!this.isSessionActive(session))
                    return;
                this.setSpinner(false);
                this.activeMode = "idle";
            });
        }
        handleShuffleIntentPressed() {
            if (this.activeMode !== "idle")
                return;
            this.suggestionIndex = (this.suggestionIndex + 1) % SanctumData_1.MANIFESTATION_SUGGESTIONS.length;
            this.updateIntentPreview();
            this.setStatus("Intent selected.\nTap Begin Vision when ready.");
        }
        handleSaveVisionPressed() {
            print("[Sanctum] Save pressed, pending=" + (this.pendingVision != null));
            if (!this.pendingVision) {
                this.setStatus("No vision to save.\nUse Begin Vision first, then tap Save.");
                return;
            }
            this.vault.addEntry(this.pendingVision.entry, this.pendingVision.texture);
            this.setStatus("Saved to Vision Vault.\n\"" + this.pendingVision.entry.intentText + "\"\n\n" +
                this.vault.getCount() + " vision(s) stored.\nTap Vault to browse.");
            this.pendingVision = null;
        }
        // ─── Vision Vault ──────────────────────────────────────
        handleVaultPressed() {
            print("[Sanctum] Vault pressed, count=" + this.vault.getCount());
            const entries = this.vault.getEntries();
            if (entries.length === 0) {
                this.setStatus("Vision Vault is empty.\nBegin Vision → Save to store your first image.");
                this.hideImage();
                return;
            }
            this.vaultBrowseIndex = 0;
            this.showVaultEntry(0);
        }
        handleVaultNext() {
            print("[Sanctum] Vault Next");
            const entries = this.vault.getEntries();
            if (entries.length === 0)
                return;
            this.vaultBrowseIndex = (this.vaultBrowseIndex + 1) % entries.length;
            this.showVaultEntry(this.vaultBrowseIndex);
        }
        handleVaultPrev() {
            print("[Sanctum] Vault Prev");
            const entries = this.vault.getEntries();
            if (entries.length === 0)
                return;
            this.vaultBrowseIndex = (this.vaultBrowseIndex - 1 + entries.length) % entries.length;
            this.showVaultEntry(this.vaultBrowseIndex);
        }
        showVaultEntry(index) {
            const entries = this.vault.getEntries();
            if (entries.length === 0)
                return;
            const entry = entries[index];
            this.setStatus("Vision Vault · " + (index + 1) + " of " + entries.length + "\n\n" +
                "\"" + entry.intentText + "\"\n\n" + entry.scriptSummary);
            this.vault.decodeEntryTexture(entry, (texture) => this.showTexture(texture), () => this.hideImage());
        }
        // ─── Public API (legacy + hub) ─────────────────────────
        triggerBreathingPractice() {
            this.hubStartBreathing();
        }
        triggerAcupressureSession() {
            this.hubStartAcupressure();
        }
        triggerManifestation() {
            this.hubBeginManifestation();
        }
        triggerChakra(index) {
            this.hubStartChakra(index);
        }
        openVault() {
            this.handleVaultPressed();
        }
        saveVision() {
            this.handleSaveVisionPressed();
        }
        vaultNext() {
            this.handleVaultNext();
        }
        vaultPrev() {
            this.handleVaultPrev();
        }
        resetPractice() {
            this.cancelActiveSession();
            this.sessionCancelled = false;
            this.textDisplay.text = "Ready to begin your wellness session";
        }
    };
    __setFunctionName(_classThis, "SanctumController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        SanctumController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
    })();
    _classThis.START_MODE = {
        Breathing: "breathing",
        Acupressure: "acupressure",
        "Chakra Tuning": "chakra",
        Manifestation: "manifestation",
    };
    (() => {
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return SanctumController = _classThis;
})();
exports.SanctumController = SanctumController;
//# sourceMappingURL=SanctumController.js.map