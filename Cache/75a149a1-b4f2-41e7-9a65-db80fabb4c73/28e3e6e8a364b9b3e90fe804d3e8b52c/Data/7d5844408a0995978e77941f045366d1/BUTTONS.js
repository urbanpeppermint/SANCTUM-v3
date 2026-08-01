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
exports.AudioButtonManager = void 0;
var __selfType = requireType("./BUTTONS");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const Interactable_1 = require("SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable");
const SIK_1 = require("SpectaclesInteractionKit.lspkg/SIK");
/**
 * Manages 7 audio tracks with interactive buttons
 * Ensures only one track plays at a time - prevents audio collision
 * CRITICAL: This script must be on an ENABLED object!
 */
let AudioButtonManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var AudioButtonManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // Interactive buttons (must have Interactable component)
            this.button1 = this.button1;
            this.button2 = this.button2;
            this.button3 = this.button3;
            this.button4 = this.button4;
            this.button5 = this.button5;
            this.button6 = this.button6;
            this.button7 = this.button7;
            // Audio components for each track
            this.audioComponent1 = this.audioComponent1;
            this.audioComponent2 = this.audioComponent2;
            this.audioComponent3 = this.audioComponent3;
            this.audioComponent4 = this.audioComponent4;
            this.audioComponent5 = this.audioComponent5;
            this.audioComponent6 = this.audioComponent6;
            this.audioComponent7 = this.audioComponent7;
            // Optional debug display
            this.debugText = this.debugText;
            // Scene object with behavior script to send animation triggers to
            this.animationObject = this.animationObject;
            this.buttons = [];
            this.audioComponents = [];
            this.currentlyPlayingIndex = -1;
            this.isInitialized = false;
        }
        __initialize() {
            super.__initialize();
            // Interactive buttons (must have Interactable component)
            this.button1 = this.button1;
            this.button2 = this.button2;
            this.button3 = this.button3;
            this.button4 = this.button4;
            this.button5 = this.button5;
            this.button6 = this.button6;
            this.button7 = this.button7;
            // Audio components for each track
            this.audioComponent1 = this.audioComponent1;
            this.audioComponent2 = this.audioComponent2;
            this.audioComponent3 = this.audioComponent3;
            this.audioComponent4 = this.audioComponent4;
            this.audioComponent5 = this.audioComponent5;
            this.audioComponent6 = this.audioComponent6;
            this.audioComponent7 = this.audioComponent7;
            // Optional debug display
            this.debugText = this.debugText;
            // Scene object with behavior script to send animation triggers to
            this.animationObject = this.animationObject;
            this.buttons = [];
            this.audioComponents = [];
            this.currentlyPlayingIndex = -1;
            this.isInitialized = false;
        }
        // Called after all objects are instantiated
        onAwake() {
            print("AudioButtonManager: Awake");
            // Create an event that will be triggered once SIK is fully initialized
            this.createEvent('OnStartEvent').bind(() => {
                this.onStartSetup();
            });
            // Setup arrays for easier management
            this.setupArrays();
            // Stop all audio initially
            this.stopAllAudio();
            if (this.debugText) {
                this.debugText.text = "Audio Ready";
            }
        }
        // Called when the script component is started
        onStart() {
            print("AudioButtonManager: Start");
            // We'll let the OnStartEvent handle the actual setup 
            // to ensure SIK is fully initialized
        }
        // Setup that runs after SIK is properly initialized
        onStartSetup() {
            print("AudioButtonManager: Running OnStartSetup");
            this.validateComponents();
            // Don't try to initialize if critical components are missing
            if (!this.checkRequiredComponents()) {
                print("AudioButtonManager: Missing critical components, initialization skipped");
                return;
            }
            this.setupButtonListeners();
        }
        // Setup arrays for easier component management
        setupArrays() {
            this.buttons = [
                this.button1, this.button2, this.button3, this.button4,
                this.button5, this.button6, this.button7
            ];
            this.audioComponents = [
                this.audioComponent1, this.audioComponent2, this.audioComponent3,
                this.audioComponent4, this.audioComponent5, this.audioComponent6,
                this.audioComponent7
            ];
        }
        // Perform components validation with helpful error messages
        validateComponents() {
            // Check buttons and their interactable components
            for (let i = 0; i < this.buttons.length; i++) {
                if (!this.buttons[i]) {
                    print(`ERROR: Button ${i + 1} not set`);
                }
                else if (!this.buttons[i].getComponent(Interactable_1.Interactable.getTypeName())) {
                    print(`ERROR: Button ${i + 1} has no Interactable component!`);
                }
            }
            // Check audio components
            for (let i = 0; i < this.audioComponents.length; i++) {
                if (!this.audioComponents[i]) {
                    print(`WARNING: Audio Component ${i + 1} not set`);
                }
            }
            // Check animation object
            if (!this.animationObject) {
                print("WARNING: Animation Object not set - no animation triggers will be sent");
            }
            // Check if SIK is available
            if (!SIK_1.SIK.InteractionManager) {
                print("CRITICAL ERROR: SIK Interaction Manager not found!");
            }
        }
        // Check if we have the minimum required components to function
        checkRequiredComponents() {
            // Need SIK interaction manager
            if (!SIK_1.SIK.InteractionManager) {
                return false;
            }
            // Need at least one button-audio pair to function
            for (let i = 0; i < this.buttons.length; i++) {
                if (this.buttons[i] && this.audioComponents[i] &&
                    this.buttons[i].getComponent(Interactable_1.Interactable.getTypeName())) {
                    return true;
                }
            }
            return false;
        }
        // Set up event listeners for all buttons
        setupButtonListeners() {
            print("Setting up button listeners");
            for (let i = 0; i < this.buttons.length; i++) {
                if (this.buttons[i] && this.audioComponents[i]) {
                    const interactable = this.buttons[i].getComponent(Interactable_1.Interactable.getTypeName());
                    if (interactable) {
                        const buttonIndex = i; // Capture index for closure
                        const onTriggerEndCallback = (event) => {
                            print(`Button ${buttonIndex + 1} pressed`);
                            this.playAudioTrack(buttonIndex);
                            this.sendAnimationTrigger();
                        };
                        interactable.onInteractorTriggerEnd.add(onTriggerEndCallback);
                        print(`Button ${i + 1} listener added`);
                    }
                }
            }
            this.isInitialized = true;
            print("All button listeners set up!");
        }
        // Play specific audio track and stop any currently playing
        playAudioTrack(trackIndex) {
            // Validate track index
            if (trackIndex < 0 || trackIndex >= this.audioComponents.length) {
                print(`Error: Invalid track index ${trackIndex}`);
                return;
            }
            // Check if audio component exists
            if (!this.audioComponents[trackIndex]) {
                print(`Error: Audio component ${trackIndex + 1} is not assigned`);
                return;
            }
            // Stop currently playing track if any (collision prevention)
            if (this.currentlyPlayingIndex !== -1) {
                this.stopCurrentTrack();
            }
            // Play the new track
            try {
                // Enable the audio component's parent SceneObject if it's disabled
                const audioObject = this.audioComponents[trackIndex].getSceneObject();
                if (audioObject && !audioObject.enabled) {
                    audioObject.enabled = true;
                }
                // Play the track in loop mode (-1 means infinite loop)
                this.audioComponents[trackIndex].play(-1);
                this.currentlyPlayingIndex = trackIndex;
                print(`Playing audio track ${trackIndex + 1} in loop mode`);
                // Update debug text
                if (this.debugText) {
                    this.debugText.text = `Playing Track ${trackIndex + 1}`;
                }
            }
            catch (error) {
                print(`Error playing audio track ${trackIndex + 1}: ${error}`);
            }
        }
        // Stop the currently playing track
        stopCurrentTrack() {
            if (this.currentlyPlayingIndex !== -1 &&
                this.audioComponents[this.currentlyPlayingIndex]) {
                this.audioComponents[this.currentlyPlayingIndex].stop(false);
                // Optionally disable the audio object to save resources
                const audioObject = this.audioComponents[this.currentlyPlayingIndex].getSceneObject();
                if (audioObject) {
                    audioObject.enabled = false;
                }
                print(`Stopped audio track ${this.currentlyPlayingIndex + 1}`);
                this.currentlyPlayingIndex = -1;
                if (this.debugText) {
                    this.debugText.text = "Audio Ready";
                }
            }
        }
        // Send custom trigger to animation object
        sendAnimationTrigger() {
            if (!this.animationObject) {
                print("Cannot send animation trigger - Animation Object not assigned");
                return;
            }
            try {
                const behaviorScript = this.animationObject.getComponent("Component.ScriptComponent");
                const api = behaviorScript ? behaviorScript.api : null;
                if (api && typeof api.sendCustomTrigger === "function") {
                    api.sendCustomTrigger("animation");
                    print("Animation trigger sent to behavior script!");
                }
            }
            catch (error) {
                print(`Error sending animation trigger: ${error}`);
            }
        }
        // Play a chakra healing tone (0 = root … 6 = crown)
        playChakraTrack(trackIndex) {
            this.playAudioTrack(trackIndex);
            this.sendAnimationTrigger();
        }
        // Public method to stop all audio (can be called from other scripts)
        stopAllAudio() {
            for (let i = 0; i < this.audioComponents.length; i++) {
                if (this.audioComponents[i]) {
                    this.audioComponents[i].stop(false);
                    // Disable audio objects to save resources
                    const audioObject = this.audioComponents[i].getSceneObject();
                    if (audioObject) {
                        audioObject.enabled = false;
                    }
                }
            }
            this.currentlyPlayingIndex = -1;
            print("Stopped all audio tracks");
            if (this.debugText) {
                this.debugText.text = "Audio Ready";
            }
        }
        // Public method to get currently playing track index (-1 if none)
        getCurrentlyPlayingTrack() {
            return this.currentlyPlayingIndex;
        }
        // Public method to check if any track is playing
        isAnyTrackPlaying() {
            return this.currentlyPlayingIndex !== -1;
        }
        // Public method to play specific track (can be called from other scripts)
        playTrack(trackIndex) {
            this.playAudioTrack(trackIndex);
        }
        // Called every frame - use for debugging if needed
        onUpdate() {
            // For debugging only - uncomment if needed
            /*
            if (!this.isInitialized) {
                print("WARNING: AudioButtonManager not properly initialized!");
            }
            */
        }
    };
    __setFunctionName(_classThis, "AudioButtonManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        AudioButtonManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return AudioButtonManager = _classThis;
})();
exports.AudioButtonManager = AudioButtonManager;
//# sourceMappingURL=BUTTONS.js.map