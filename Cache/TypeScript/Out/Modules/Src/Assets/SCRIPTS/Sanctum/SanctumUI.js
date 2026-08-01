"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SanctumUI = exports.VISION_DISPLAY_SCALE = exports.VISION_DISPLAY_LOCAL = exports.HUB_CAMERA_LOCAL = void 0;
const BackPlate_1 = require("SpectaclesUIKit.lspkg/Scripts/BackPlate");
const RectangleButton_1 = require("SpectaclesUIKit.lspkg/Scripts/Components/Button/RectangleButton");
const SanctumData_1 = require("./SanctumData");
const SanctumHubLayout_1 = require("./SanctumHubLayout");
/** @deprecated Use SanctumHubLayoutConfig.hubLocalPosition via SanctumMainManager */
exports.HUB_CAMERA_LOCAL = SanctumHubLayout_1.DEFAULT_HUB_LAYOUT.hubLocalPosition;
/** @deprecated Use SanctumHubLayoutConfig.visionLocalPosition */
exports.VISION_DISPLAY_LOCAL = SanctumHubLayout_1.DEFAULT_HUB_LAYOUT.visionLocalPosition;
/** @deprecated Use SanctumHubLayoutConfig.visionScale */
exports.VISION_DISPLAY_SCALE = SanctumHubLayout_1.DEFAULT_HUB_LAYOUT.visionScale;
function truncateLabel(text, maxLen) {
    if (text.length <= maxLen)
        return text;
    return text.slice(0, maxLen - 1) + "…";
}
/** Manual vertical stack (LS 5.15 — no FlexLayout / Text.layoutRect). */
class VStack {
    constructor(topY) {
        this.y = topY;
    }
    /** Place object with its CENTER at current cursor - height/2, then advance. */
    place(so, height, gap) {
        const centerY = this.y - height / 2;
        so.getTransform().setLocalPosition(new vec3(0, centerY, 0));
        this.y -= height + gap;
    }
    remainingTop() {
        return this.y;
    }
    setTop(y) {
        this.y = y;
    }
}
/**
 * Compact Sanctum hub for LS 5.15 — fixed-width manual layout, single view slot.
 */
class SanctumUI {
    constructor(parent, localPosition, config) {
        this.callbacks = null;
        this.views = {};
        this.backRow = null;
        this.carouselLabel = null;
        this.micButtonLabel = null;
        this.currentView = "main";
        this.desireIndex = 0;
        this.cfg = config ?? SanctumHubLayout_1.DEFAULT_HUB_LAYOUT;
        this.cw = (0, SanctumHubLayout_1.contentWidth)(this.cfg);
        this.root = global.scene.createSceneObject("SanctumHub");
        this.root.setParent(parent);
        this.root.getTransform().setLocalPosition(localPosition);
        this.root.createComponent("Component.Canvas");
        this.backPlate = this.root.createComponent(BackPlate_1.BackPlate.getTypeName());
        this.backPlate.size = new vec2(this.cfg.panelWidth, this.estimatePanelHeight(true));
        const content = global.scene.createSceneObject("Content");
        content.setParent(this.root);
        content.getTransform().setLocalPosition(new vec3(0, 0, this.cfg.contentZ));
        const panelH = this.estimatePanelHeight(true);
        const stack = new VStack(panelH / 2 - this.cfg.panelPadding);
        this.addTitle(content, stack, "SANCTUM");
        this.statusText = this.addTextBlock(content, stack, "Status", "Select a practice.", this.cfg.statusHeight);
        this.intentText = this.addTextBlock(content, stack, "IntentPreview", "", this.cfg.intentHeight);
        this.intentText.sceneObject.enabled = false;
        this.viewPort = global.scene.createSceneObject("ViewPort");
        this.viewPort.setParent(content);
        stack.place(this.viewPort, this.cfg.viewportHeight, this.cfg.rowGap);
        this.views.main = this.buildMainMenu(this.viewPort);
        this.views.breathing = this.buildBreathingMenu(this.viewPort);
        this.views.acupressure = this.buildAcupressureMenu(this.viewPort);
        this.views.chakra = this.buildChakraMenu(this.viewPort);
        this.views.manifestation = this.buildManifestationMenu(this.viewPort);
        this.views.manifestList = this.buildManifestListMenu(this.viewPort);
        this.views.manifestVoice = this.buildManifestVoiceMenu(this.viewPort);
        this.backRow = this.buildBackRow(content, stack);
        this.showView("main");
    }
    bindCallbacks(cb) {
        this.callbacks = cb;
    }
    showView(view) {
        this.currentView = view;
        const keys = [
            "main", "breathing", "acupressure", "chakra",
            "manifestation", "manifestList", "manifestVoice",
        ];
        for (let i = 0; i < keys.length; i++) {
            const node = this.views[keys[i]];
            if (node)
                node.enabled = keys[i] === view;
        }
        const showBack = view !== "main";
        if (this.backRow)
            this.backRow.enabled = showBack;
        const showIntent = view === "manifestList" || view === "manifestVoice";
        if (this.intentText) {
            this.intentText.sceneObject.enabled = showIntent;
            if (showIntent && view === "manifestList") {
                this.setIntentPreview(SanctumData_1.MANIFESTATION_DESIRES[this.desireIndex]);
            }
        }
        // Panel always sized for back row space so it never clips
        this.backPlate.size = new vec2(this.cfg.panelWidth, this.estimatePanelHeight(true));
        print("[SanctumUI] view → " + view);
    }
    getView() {
        return this.currentView;
    }
    setStatus(msg) {
        if (this.statusText)
            this.statusText.text = msg;
    }
    setIntentPreview(text) {
        if (this.intentText) {
            this.intentText.text = text.trim().length > 0 ? "Focus: " + text : "";
        }
    }
    setDesirePreview(text) {
        this.setIntentPreview(text);
    }
    setDesireIndex(index) {
        this.desireIndex = index % SanctumData_1.MANIFESTATION_DESIRES.length;
        if (this.desireIndex < 0)
            this.desireIndex += SanctumData_1.MANIFESTATION_DESIRES.length;
        const label = SanctumData_1.MANIFESTATION_DESIRES[this.desireIndex];
        this.setIntentPreview(label);
        if (this.carouselLabel) {
            this.carouselLabel.text = truncateLabel(label, 12);
        }
    }
    getDesireIndex() {
        return this.desireIndex;
    }
    getSelectedDesire() {
        return SanctumData_1.MANIFESTATION_DESIRES[this.desireIndex];
    }
    setMicActive(active) {
        if (this.micButtonLabel) {
            this.micButtonLabel.text = active ? "Listening…" : "Start Microphone";
        }
    }
    /** Panel height always reserves back row + intent row so nothing clips. */
    estimatePanelHeight(_showBack) {
        const p = this.cfg.panelPadding;
        const h = p * 2 +
            this.cfg.titleHeight +
            this.cfg.statusHeight +
            this.cfg.intentHeight +
            this.cfg.viewportHeight +
            this.cfg.backRowHeight +
            this.cfg.rowGap * 5;
        return Math.max(h, 12);
    }
    /** View stack starts at the TOP inside the viewport (viewport centered at 0). */
    viewStack(_host) {
        return new VStack(this.cfg.viewportHeight / 2 - 0.2);
    }
    buildMainMenu(parent) {
        const host = global.scene.createSceneObject("View_main");
        host.setParent(parent);
        host.getTransform().setLocalPosition(new vec3(0, 0, 0));
        const stack = this.viewStack(host);
        this.btn(host, stack, "Breathing", this.cw, () => this.callbacks?.onNavigate("breathing"));
        this.btn(host, stack, "Acupressure", this.cw, () => this.callbacks?.onNavigate("acupressure"));
        this.btn(host, stack, "Manifestation", this.cw, () => this.callbacks?.onNavigate("manifestation"));
        this.btn(host, stack, "Chakra Tuning", this.cw, () => this.callbacks?.onNavigate("chakra"));
        return host;
    }
    buildBreathingMenu(parent) {
        return this.buildSimpleStartMenu(parent, "breathing", "Breathing", "Guided breath cycles with focused visuals.", () => this.callbacks?.onStartBreathing());
    }
    buildAcupressureMenu(parent) {
        return this.buildSimpleStartMenu(parent, "acupressure", "Acupressure", "Three pressure points with guided imagery.", () => this.callbacks?.onStartAcupressure());
    }
    buildSimpleStartMenu(parent, name, title, blurb, onStart) {
        const host = global.scene.createSceneObject("View_" + name);
        host.setParent(parent);
        host.enabled = false;
        host.getTransform().setLocalPosition(new vec3(0, 0, 0));
        const stack = this.viewStack(host);
        this.textRow(host, stack, title.toUpperCase(), 3.0, "Caption");
        this.textRow(host, stack, blurb, 3.6, "Body");
        this.btn(host, stack, "Start Session", this.cw, onStart);
        return host;
    }
    buildChakraMenu(parent) {
        const host = global.scene.createSceneObject("View_chakra");
        host.setParent(parent);
        host.enabled = false;
        host.getTransform().setLocalPosition(new vec3(0, 0, 0));
        const stack = this.viewStack(host);
        const labels = ["Root", "Sacral", "Solar", "Heart", "Throat", "3rd Eye", "Crown"];
        const rows = [labels.slice(0, 4), labels.slice(4)];
        this.textRow(host, stack, "CHAKRA TUNING", 2.6, "Caption");
        this.textRow(host, stack, "Tap a center or pinch lotus on the figure", 2.8, "Body");
        const gap = 0.4;
        for (let r = 0; r < rows.length; r++) {
            const row = global.scene.createSceneObject("ChakraRow_" + r);
            row.setParent(host);
            stack.place(row, this.cfg.buttonHeight, this.cfg.rowGap);
            const group = rows[r];
            const w = (this.cw - gap * Math.max(group.length - 1, 0)) / group.length;
            let x = -this.cw / 2 + w / 2;
            for (let i = 0; i < group.length; i++) {
                const idx = labels.indexOf(group[i]);
                this.btnAt(row, group[i], w, new vec3(x, 0, 0), () => this.callbacks?.onStartChakra(idx));
                x += w + gap;
            }
        }
        return host;
    }
    buildManifestationMenu(parent) {
        const host = global.scene.createSceneObject("View_manifestation");
        host.setParent(parent);
        host.enabled = false;
        host.getTransform().setLocalPosition(new vec3(0, 0, 0));
        const stack = this.viewStack(host);
        this.textRow(host, stack, "MANIFESTATION", 2.6, "Caption");
        this.btn(host, stack, "Browse Intentions", this.cw, () => {
            this.setDesireIndex(0);
            this.callbacks?.onNavigate("manifestList");
            this.callbacks?.onOpenManifestList();
        });
        this.btn(host, stack, "Voice Intent", this.cw, () => {
            this.callbacks?.onNavigate("manifestVoice");
            this.callbacks?.onOpenManifestVoice();
        });
        return host;
    }
    buildManifestListMenu(parent) {
        const host = global.scene.createSceneObject("View_manifestList");
        host.setParent(parent);
        host.enabled = false;
        host.getTransform().setLocalPosition(new vec3(0, 0, 0));
        const stack = this.viewStack(host);
        this.textRow(host, stack, "SELECT INTENTION", 2.6, "Caption");
        const carousel = global.scene.createSceneObject("Carousel");
        carousel.setParent(host);
        stack.place(carousel, this.cfg.buttonHeight, this.cfg.rowGap);
        const cw3 = (this.cw - 0.9) / 3;
        const centerBtn = global.scene.createSceneObject("Btn_Center");
        centerBtn.setParent(carousel);
        const centerButton = centerBtn.createComponent(RectangleButton_1.RectangleButton.getTypeName());
        centerButton.size = new vec3(cw3, this.cfg.buttonHeight, 1);
        this.carouselLabel = this.label(centerBtn, truncateLabel(SanctumData_1.MANIFESTATION_DESIRES[0], 12), cw3 - 0.3);
        centerButton.onTriggerUp.add(() => {
            print("[SanctumUI] Select intention");
            this.callbacks?.onDesireSelect();
        });
        centerBtn.getTransform().setLocalPosition(new vec3(0, 0, 0));
        this.btnAt(carousel, "◀", cw3, new vec3(-cw3 - 0.45, 0, 0), () => {
            this.setDesireIndex(this.desireIndex - 1);
            this.callbacks?.onDesirePrev();
        });
        this.btnAt(carousel, "▶", cw3, new vec3(cw3 + 0.45, 0, 0), () => {
            this.setDesireIndex(this.desireIndex + 1);
            this.callbacks?.onDesireNext();
        });
        this.btn(host, stack, "Generate Visualization", this.cw, () => this.callbacks?.onBeginManifestation());
        const vault = global.scene.createSceneObject("VaultRow");
        vault.setParent(host);
        stack.place(vault, this.cfg.buttonHeight, this.cfg.rowGap);
        const vw = (this.cw - 1.05) / 4;
        let vx = -this.cw / 2 + vw / 2;
        this.btnAt(vault, "Vault", vw, new vec3(vx, 0, 0), () => this.callbacks?.onVault());
        vx += vw + 0.35;
        this.btnAt(vault, "Save", vw, new vec3(vx, 0, 0), () => this.callbacks?.onSaveVision());
        vx += vw + 0.35;
        this.btnAt(vault, "Prev", vw, new vec3(vx, 0, 0), () => this.callbacks?.onVaultPrev());
        vx += vw + 0.35;
        this.btnAt(vault, "Next", vw, new vec3(vx, 0, 0), () => this.callbacks?.onVaultNext());
        return host;
    }
    buildManifestVoiceMenu(parent) {
        const host = global.scene.createSceneObject("View_manifestVoice");
        host.setParent(parent);
        host.enabled = false;
        host.getTransform().setLocalPosition(new vec3(0, 0, 0));
        const stack = this.viewStack(host);
        this.textRow(host, stack, "VOICE INTENT", 2.6, "Caption");
        this.textRow(host, stack, "Speak a word or short phrase.", 2.8, "Body");
        const micBtn = global.scene.createSceneObject("Btn_Mic");
        micBtn.setParent(host);
        stack.place(micBtn, this.cfg.buttonHeight, this.cfg.rowGap);
        const micButton = micBtn.createComponent(RectangleButton_1.RectangleButton.getTypeName());
        micButton.size = new vec3(this.cw, this.cfg.buttonHeight, 1);
        this.micButtonLabel = this.label(micBtn, "Start Microphone", this.cw - 0.4);
        micButton.onTriggerUp.add(() => this.callbacks?.onStartVoiceCapture());
        this.btn(host, stack, "Type Instead", this.cw, () => this.callbacks?.onTypeIntent());
        this.btn(host, stack, "Generate Visualization", this.cw, () => this.callbacks?.onBeginManifestation());
        return host;
    }
    /**
     * Back row lives OUTSIDE the viewport at the bottom of the panel.
     * We compute an absolute Y from the panel bottom so it never clips.
     */
    buildBackRow(parent, _stack) {
        const host = global.scene.createSceneObject("BackRow");
        host.setParent(parent);
        host.enabled = false;
        const panelH = this.estimatePanelHeight(true);
        const y = -panelH / 2 + this.cfg.panelPadding + this.cfg.backRowHeight / 2;
        host.getTransform().setLocalPosition(new vec3(0, y, 0));
        this.btnAt(host, "← Main Menu", this.cw, vec3.zero(), () => this.callbacks?.onBackToMain());
        return host;
    }
    fontSize(role) {
        switch (role) {
            case "Headline1": return this.cfg.fontHeadline;
            case "Caption": return this.cfg.fontCaption;
            case "Button": return this.cfg.fontButton;
            default: return this.cfg.fontBody;
        }
    }
    applyRole(t, role) {
        t.size = this.fontSize(role);
        t.weight =
            role === "Headline1" || role === "Caption" ? 700 : 500;
    }
    addTitle(parent, stack, text) {
        const so = global.scene.createSceneObject("Title");
        so.setParent(parent);
        stack.place(so, this.cfg.titleHeight, this.cfg.rowGap);
        const t = so.createComponent("Component.Text");
        t.text = text;
        this.applyRole(t, "Headline1");
        t.horizontalAlignment = HorizontalAlignment.Left;
        t.verticalAlignment = VerticalAlignment.Center;
        t.depthTest = true;
    }
    addTextBlock(parent, stack, name, text, h) {
        const so = global.scene.createSceneObject(name);
        so.setParent(parent);
        stack.place(so, h, this.cfg.rowGap);
        const t = so.createComponent("Component.Text");
        t.text = text;
        this.applyRole(t, "Body");
        t.horizontalAlignment = HorizontalAlignment.Left;
        t.verticalAlignment = VerticalAlignment.Center;
        t.horizontalOverflow = HorizontalOverflow.Wrap;
        t.verticalOverflow = VerticalOverflow.Overflow;
        t.depthTest = true;
        return t;
    }
    textRow(parent, stack, text, h, role) {
        const so = global.scene.createSceneObject("Txt");
        so.setParent(parent);
        stack.place(so, h, this.cfg.rowGap);
        const t = so.createComponent("Component.Text");
        t.text = text;
        this.applyRole(t, role);
        t.horizontalAlignment = HorizontalAlignment.Left;
        t.verticalAlignment = VerticalAlignment.Center;
        t.horizontalOverflow = HorizontalOverflow.Wrap;
        t.depthTest = true;
    }
    btn(parent, stack, label, w, onClick) {
        const so = global.scene.createSceneObject("Btn_" + label.replace(/[\s←▶◀]/g, ""));
        so.setParent(parent);
        stack.place(so, this.cfg.buttonHeight, this.cfg.rowGap);
        this.setupButton(so, label, w, onClick);
    }
    btnAt(parent, label, w, localPos, onClick) {
        const so = global.scene.createSceneObject("Btn_" + label.replace(/[\s←▶◀]/g, ""));
        so.setParent(parent);
        so.getTransform().setLocalPosition(localPos);
        this.setupButton(so, label, w, onClick);
    }
    setupButton(so, label, w, onClick) {
        const btn = so.createComponent(RectangleButton_1.RectangleButton.getTypeName());
        btn.size = new vec3(w, this.cfg.buttonHeight, 1);
        this.label(so, label, w - 0.35);
        btn.onTriggerUp.add(() => {
            print("[SanctumUI] " + label);
            onClick();
        });
    }
    label(parent, text, _w) {
        const so = global.scene.createSceneObject("Lbl");
        so.setParent(parent);
        so.getTransform().setLocalPosition(new vec3(0, 0, 0.08));
        const t = so.createComponent("Component.Text");
        t.text = text;
        this.applyRole(t, "Button");
        t.horizontalAlignment = HorizontalAlignment.Center;
        t.verticalAlignment = VerticalAlignment.Center;
        t.depthTest = true;
        return t;
    }
}
exports.SanctumUI = SanctumUI;
//# sourceMappingURL=SanctumUI.js.map