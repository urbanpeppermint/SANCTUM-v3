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
exports.SanctumMainManager = void 0;
var __selfType = requireType("./SanctumMainManager");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SanctumController_1 = require("./SanctumController");
const SanctumHubLayout_1 = require("./SanctumHubLayout");
const SanctumUI_1 = require("./SanctumUI");
/**
 * Unified Sanctum entry point: UIKit practice hub + legacy chakra/audio wiring.
 *
 * Scene setup:
 * 1. LS 5.15: SIK 0.15 + SpectaclesUIKit (515-native) in Packages/. Do not use 5.22 .lspkg builds.
 * 2. Attach this script to a SceneObject (e.g. "SanctumManager" at origin).
 * 3. Wire sanctumController → object with SanctumController (replaces ExampleOAICalls).
 * 4. Wire audioManagerObject → BUTTONS (AudioButtonManager).
 * 5. Wire legacy ground lotus objects to hide after the hub spawns.
 * 6. Assign spinner + vision image from existing ExampleOAICalls object.
 */
let SanctumMainManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var SanctumMainManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.sanctumControllerObject = this.sanctumControllerObject;
            this.audioManagerObject = this.audioManagerObject;
            this.spinner = this.spinner;
            this.visionImage = this.visionImage;
            this.panelPosition = this.panelPosition;
            this.hubParentObject = this.hubParentObject;
            this.hubAnchorObject = this.hubAnchorObject;
            this.panelWidth = this.panelWidth;
            this.panelPadding = this.panelPadding;
            this.buttonHeight = this.buttonHeight;
            this.rowGap = this.rowGap;
            this.viewportHeight = this.viewportHeight;
            this.fontHeadline = this.fontHeadline;
            this.fontBody = this.fontBody;
            this.fontCaption = this.fontCaption;
            this.fontButton = this.fontButton;
            this.visionLocalPosition = this.visionLocalPosition;
            this.visionScale = this.visionScale;
            this.legacyBreathingButton = this.legacyBreathingButton;
            this.legacyAcupressureButton = this.legacyAcupressureButton;
            this.legacyManifestButton = this.legacyManifestButton;
            this.hideLegacyMenu = this.hideLegacyMenu;
            this.controller = null;
            this.ui = null;
            this.hubInitFramesRemaining = -1;
        }
        __initialize() {
            super.__initialize();
            this.sanctumControllerObject = this.sanctumControllerObject;
            this.audioManagerObject = this.audioManagerObject;
            this.spinner = this.spinner;
            this.visionImage = this.visionImage;
            this.panelPosition = this.panelPosition;
            this.hubParentObject = this.hubParentObject;
            this.hubAnchorObject = this.hubAnchorObject;
            this.panelWidth = this.panelWidth;
            this.panelPadding = this.panelPadding;
            this.buttonHeight = this.buttonHeight;
            this.rowGap = this.rowGap;
            this.viewportHeight = this.viewportHeight;
            this.fontHeadline = this.fontHeadline;
            this.fontBody = this.fontBody;
            this.fontCaption = this.fontCaption;
            this.fontButton = this.fontButton;
            this.visionLocalPosition = this.visionLocalPosition;
            this.visionScale = this.visionScale;
            this.legacyBreathingButton = this.legacyBreathingButton;
            this.legacyAcupressureButton = this.legacyAcupressureButton;
            this.legacyManifestButton = this.legacyManifestButton;
            this.hideLegacyMenu = this.hideLegacyMenu;
            this.controller = null;
            this.ui = null;
            this.hubInitFramesRemaining = -1;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.scheduleInitialize());
            this.createEvent("UpdateEvent").bind(() => this.tickHubInit());
        }
        /** Wait several frames so UIKit components on new objects are fully awake. */
        scheduleInitialize() {
            this.hideLegacyFloatingText();
            this.hideLegacyButtons();
            this.autoWireReferences();
            if (!this.sanctumControllerObject) {
                print("SanctumMainManager: sanctumControllerObject not set");
                return;
            }
            this.controller = this.sanctumControllerObject.getComponent(SanctumController_1.SanctumController.getTypeName());
            if (!this.controller) {
                print("SanctumMainManager: SanctumController component missing");
                return;
            }
            this.hubInitFramesRemaining = 8;
        }
        tickHubInit() {
            if (this.hubInitFramesRemaining < 0)
                return;
            this.hubInitFramesRemaining--;
            if (this.hubInitFramesRemaining === 0) {
                this.hubInitFramesRemaining = -1;
                this.finishInitialize();
            }
        }
        finishInitialize() {
            if (!this.controller)
                return;
            try {
                this.buildHub();
                this.hideLegacyButtons();
                this.hideLegacyFloatingText();
                print("SanctumMainManager: hub ready");
            }
            catch (error) {
                print("SanctumMainManager: hub build failed — " + error);
            }
        }
        /** Resolve common scene refs by name when Inspector inputs are empty. */
        autoWireReferences() {
            if (!this.sanctumControllerObject) {
                if (this.sceneObject.getComponent(SanctumController_1.SanctumController.getTypeName())) {
                    this.sanctumControllerObject = this.sceneObject;
                }
                else {
                    this.sanctumControllerObject = this.findSceneObjectByName("ExampleOAICalls") ??
                        this.findSceneObjectByName("SanctumManager");
                }
            }
            if (!this.audioManagerObject) {
                this.audioManagerObject = this.findSceneObjectByName("BUTTONS");
            }
            if (!this.spinner) {
                const oai = this.sanctumControllerObject;
                if (oai) {
                    this.spinner = this.findChildByName(oai, "LoadingSpinner");
                }
            }
            if (!this.visionImage && this.sanctumControllerObject) {
                const imageObj = this.findChildByName(this.sanctumControllerObject, "ImageOutputExample") ??
                    this.findChildByName(this.sanctumControllerObject, "Image");
                if (imageObj) {
                    this.visionImage = imageObj.getComponent("Component.Image");
                }
            }
            if (!this.legacyBreathingButton) {
                const breatheLabel = this.findSceneObjectByName("Breathe");
                if (breatheLabel) {
                    this.legacyBreathingButton = breatheLabel;
                }
            }
            if (!this.legacyAcupressureButton) {
                const acu = this.findSceneObjectByName("Acupressure");
                if (acu)
                    this.legacyAcupressureButton = acu;
            }
            const lotusButtons = this.findAllByName("LOD0_LotusFlower");
            for (let i = 0; i < lotusButtons.length; i++) {
                const lotus = lotusButtons[i];
                if (!this.legacyBreathingButton)
                    this.legacyBreathingButton = lotus;
                else if (!this.legacyAcupressureButton && lotus !== this.legacyBreathingButton) {
                    this.legacyAcupressureButton = lotus;
                }
            }
        }
        findSceneObjectByName(name) {
            const roots = global.scene.getRootObjectsCount();
            for (let i = 0; i < roots; i++) {
                const hit = this.findByNameRecursive(global.scene.getRootObject(i), name);
                if (hit)
                    return hit;
            }
            return null;
        }
        findAllByName(name) {
            const out = [];
            const roots = global.scene.getRootObjectsCount();
            for (let i = 0; i < roots; i++) {
                this.collectByNameRecursive(global.scene.getRootObject(i), name, out);
            }
            return out;
        }
        findByNameRecursive(node, name) {
            if (node.name === name)
                return node;
            const count = node.getChildrenCount();
            for (let i = 0; i < count; i++) {
                const hit = this.findByNameRecursive(node.getChild(i), name);
                if (hit)
                    return hit;
            }
            return null;
        }
        collectByNameRecursive(node, name, out) {
            if (node.name === name)
                out.push(node);
            const count = node.getChildrenCount();
            for (let i = 0; i < count; i++) {
                this.collectByNameRecursive(node.getChild(i), name, out);
            }
        }
        findChildByName(parent, name) {
            return this.findByNameRecursive(parent, name);
        }
        buildHub() {
            const existing = this.findChildByName(this.sceneObject, "SanctumHub");
            if (existing) {
                existing.destroy();
            }
            this.ui = new SanctumUI_1.SanctumUI(this.resolveHubParent(), this.resolveHubLocalPosition(), this.buildLayoutConfig());
            if (this.ui.statusText) {
                this.controller.bindStatusText(this.ui.statusText);
            }
            const display = this.createVisionDisplay(this.resolveHubParent());
            if (display) {
                this.controller.bindVisionImage(display);
            }
            this.controller.bindHubUI(this.ui);
            this.ui.bindCallbacks({
                onNavigate: (view) => this.controller.hubNavigate(view),
                onBackToMain: () => this.controller.hubBackToMain(),
                onStartBreathing: () => this.controller.hubStartBreathing(),
                onStartAcupressure: () => this.controller.hubStartAcupressure(),
                onStartChakra: (index) => this.controller.hubStartChakra(index),
                onOpenManifestList: () => this.controller.hubOpenManifestList(),
                onOpenManifestVoice: () => this.controller.hubOpenManifestVoice(),
                onDesirePrev: () => this.controller.hubDesirePrev(),
                onDesireNext: () => this.controller.hubDesireNext(),
                onDesireSelect: () => this.controller.hubDesireSelect(),
                onBeginManifestation: () => this.controller.hubBeginManifestation(),
                onStartVoiceCapture: () => this.controller.hubStartVoiceCapture(),
                onTypeIntent: () => this.controller.hubTypeIntent(),
                onVault: () => this.controller.openVault(),
                onSaveVision: () => this.controller.saveVision(),
                onVaultNext: () => this.controller.vaultNext(),
                onVaultPrev: () => this.controller.vaultPrev(),
            });
            this.ui.setStatus("Choose a practice from the menu.");
        }
        buildLayoutConfig() {
            const d = SanctumHubLayout_1.DEFAULT_HUB_LAYOUT;
            return {
                panelWidth: this.positiveOr(this.panelWidth, d.panelWidth),
                panelPadding: this.positiveOr(this.panelPadding, d.panelPadding),
                buttonHeight: this.positiveOr(this.buttonHeight, d.buttonHeight),
                rowGap: this.positiveOr(this.rowGap, d.rowGap),
                viewportHeight: this.positiveOr(this.viewportHeight, d.viewportHeight),
                statusHeight: d.statusHeight,
                intentHeight: d.intentHeight,
                titleHeight: d.titleHeight,
                backRowHeight: d.backRowHeight,
                contentZ: d.contentZ,
                hubLocalPosition: this.resolveHubLocalPosition(),
                visionLocalPosition: this.nonZeroVec3(this.visionLocalPosition, d.visionLocalPosition),
                visionScale: this.nonZeroVec3(this.visionScale, d.visionScale),
                fontHeadline: this.positiveOr(this.fontHeadline, d.fontHeadline),
                fontBody: this.positiveOr(this.fontBody, d.fontBody),
                fontCaption: this.positiveOr(this.fontCaption, d.fontCaption),
                fontButton: this.positiveOr(this.fontButton, d.fontButton),
            };
        }
        positiveOr(value, fallback) {
            return value > 0.001 ? value : fallback;
        }
        isZeroVec3(v) {
            return Math.abs(v.x) < 0.001 && Math.abs(v.y) < 0.001 && Math.abs(v.z) < 0.001;
        }
        nonZeroVec3(v, fallback) {
            return this.isZeroVec3(v) ? fallback : v;
        }
        /** Reparent legacy ImageOutputExample — bare runtime Images have no material (clone crash). */
        createVisionDisplay(parent) {
            const cfg = this.buildLayoutConfig();
            const existing = this.findChildByName(parent, "SanctumVisionDisplay");
            if (existing)
                existing.destroy();
            if (this.visionImage && this.visionImage.mainMaterial) {
                const so = this.visionImage.sceneObject;
                so.setParent(parent);
                so.getTransform().setLocalPosition(cfg.visionLocalPosition);
                so.getTransform().setLocalScale(cfg.visionScale);
                so.name = "SanctumVisionDisplay";
                so.enabled = false;
                print("[SanctumMainManager] vision display reparented (wired Image)");
                return this.visionImage;
            }
            const legacyObj = this.findChildByName(this.sanctumControllerObject, "ImageOutputExample");
            if (legacyObj) {
                const img = legacyObj.getComponent("Component.Image");
                if (img && img.mainMaterial) {
                    legacyObj.setParent(parent);
                    legacyObj.getTransform().setLocalPosition(cfg.visionLocalPosition);
                    legacyObj.getTransform().setLocalScale(cfg.visionScale);
                    legacyObj.name = "SanctumVisionDisplay";
                    legacyObj.enabled = false;
                    this.visionImage = img;
                    print("[SanctumMainManager] vision display reparented (ImageOutputExample)");
                    return img;
                }
            }
            print("[SanctumMainManager] no vision image with material — vision frame disabled");
            return null;
        }
        /** Parent for SanctumHub — Inspector hubParentObject, else Camera, else this object. */
        resolveHubParent() {
            if (this.hubParentObject)
                return this.hubParentObject;
            return (this.findSceneObjectByName("Camera") ??
                this.findSceneObjectByName("Camera Object") ??
                this.sceneObject);
        }
        resolveHubLocalPosition() {
            if (this.hubAnchorObject) {
                return this.hubAnchorObject.getTransform().getLocalPosition();
            }
            if (!this.isZeroVec3(this.panelPosition)) {
                return this.panelPosition;
            }
            return SanctumHubLayout_1.DEFAULT_HUB_LAYOUT.hubLocalPosition;
        }
        hideLegacyButtons() {
            if (!this.hideLegacyMenu)
                return;
            this.setHidden(this.legacyBreathingButton);
            this.setHidden(this.legacyAcupressureButton);
            this.setHidden(this.legacyManifestButton);
            this.setHidden(this.findSceneObjectByName("Breathe"));
            this.setHidden(this.findSceneObjectByName("Acupressure"));
            this.setHidden(this.findSceneObjectByName("flowers sanctum"));
            this.setHidden(this.findSceneObjectByName("flowers sanctum 1"));
            const lotusButtons = this.findAllByName("LOD0_LotusFlower");
            for (let i = 0; i < lotusButtons.length; i++) {
                this.setHidden(lotusButtons[i]);
            }
            const lotusPads = this.findAllByName("LOD0_LotusPad_Leaf");
            for (let i = 0; i < lotusPads.length; i++) {
                this.setHidden(lotusPads[i]);
            }
        }
        /** Hide legacy TextOutput once the hub owns status display. */
        hideLegacyFloatingText() {
            const legacy = this.findChildByName(this.sceneObject, "TextOutput");
            if (legacy)
                legacy.enabled = false;
        }
        setHidden(obj) {
            if (obj)
                obj.enabled = false;
        }
    };
    __setFunctionName(_classThis, "SanctumMainManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        SanctumMainManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return SanctumMainManager = _classThis;
})();
exports.SanctumMainManager = SanctumMainManager;
//# sourceMappingURL=SanctumMainManager.js.map