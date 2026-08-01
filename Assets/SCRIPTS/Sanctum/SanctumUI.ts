import { BackPlate } from "SpectaclesUIKit.lspkg/Scripts/BackPlate";
import { RectangleButton } from "SpectaclesUIKit.lspkg/Scripts/Components/Button/RectangleButton";
import { MANIFESTATION_DESIRES } from "./SanctumData";
import { contentWidth, DEFAULT_HUB_LAYOUT, SanctumHubLayoutConfig } from "./SanctumHubLayout";
import { HubView, SanctumUICallbacks } from "./SanctumTypes";

type TextRole = "Headline1" | "Body" | "Caption" | "Button";

/** @deprecated Use SanctumHubLayoutConfig.hubLocalPosition via SanctumMainManager */
export const HUB_CAMERA_LOCAL = DEFAULT_HUB_LAYOUT.hubLocalPosition;
/** @deprecated Use SanctumHubLayoutConfig.visionLocalPosition */
export const VISION_DISPLAY_LOCAL = DEFAULT_HUB_LAYOUT.visionLocalPosition;
/** @deprecated Use SanctumHubLayoutConfig.visionScale */
export const VISION_DISPLAY_SCALE = DEFAULT_HUB_LAYOUT.visionScale;

function truncateLabel(text: string, maxLen: number): string {
  if (text.length <= maxLen) return text;
  return text.slice(0, maxLen - 1) + "…";
}

/** Manual vertical stack (LS 5.15 — no FlexLayout / Text.layoutRect). */
class VStack {
  private y: number;

  constructor(topY: number) {
    this.y = topY;
  }

  /** Place object with its CENTER at current cursor - height/2, then advance. */
  place(so: SceneObject, height: number, gap: number): void {
    const centerY = this.y - height / 2;
    so.getTransform().setLocalPosition(new vec3(0, centerY, 0));
    this.y -= height + gap;
  }

  remainingTop(): number {
    return this.y;
  }

  setTop(y: number): void {
    this.y = y;
  }
}

/**
 * Compact Sanctum hub for LS 5.15 — fixed-width manual layout, single view slot.
 */
export class SanctumUI {
  readonly root: SceneObject;
  readonly statusText: Text;
  readonly intentText: Text;

  private readonly cfg: SanctumHubLayoutConfig;
  private readonly cw: number;

  private callbacks: SanctumUICallbacks | null = null;
  private views: Partial<Record<HubView, SceneObject>> = {};
  private viewPort: SceneObject;
  private backRow: SceneObject | null = null;
  private carouselLabel: Text | null = null;
  private micButtonLabel: Text | null = null;
  private currentView: HubView = "main";
  private desireIndex = 0;
  private backPlate: BackPlate;

  constructor(parent: SceneObject, localPosition: vec3, config?: SanctumHubLayoutConfig) {
    this.cfg = config ?? DEFAULT_HUB_LAYOUT;
    this.cw = contentWidth(this.cfg);

    this.root = global.scene.createSceneObject("SanctumHub");
    this.root.setParent(parent);
    this.root.getTransform().setLocalPosition(localPosition);
    this.root.createComponent("Component.Canvas");
    this.backPlate = this.root.createComponent(BackPlate.getTypeName()) as BackPlate;
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

  bindCallbacks(cb: SanctumUICallbacks): void {
    this.callbacks = cb;
  }

  showView(view: HubView): void {
    this.currentView = view;
    const keys: HubView[] = [
      "main", "breathing", "acupressure", "chakra",
      "manifestation", "manifestList", "manifestVoice",
    ];
    for (let i = 0; i < keys.length; i++) {
      const node = this.views[keys[i]];
      if (node) node.enabled = keys[i] === view;
    }

    const showBack = view !== "main";
    if (this.backRow) this.backRow.enabled = showBack;

    const showIntent = view === "manifestList" || view === "manifestVoice";
    if (this.intentText) {
      this.intentText.sceneObject.enabled = showIntent;
      if (showIntent && view === "manifestList") {
        this.setIntentPreview(MANIFESTATION_DESIRES[this.desireIndex]);
      }
    }

    // Panel always sized for back row space so it never clips
    this.backPlate.size = new vec2(this.cfg.panelWidth, this.estimatePanelHeight(true));
    print("[SanctumUI] view → " + view);
  }

  getView(): HubView {
    return this.currentView;
  }

  setStatus(msg: string): void {
    if (this.statusText) this.statusText.text = msg;
  }

  setIntentPreview(text: string): void {
    if (this.intentText) {
      this.intentText.text = text.trim().length > 0 ? "Focus: " + text : "";
    }
  }

  setDesirePreview(text: string): void {
    this.setIntentPreview(text);
  }

  setDesireIndex(index: number): void {
    this.desireIndex = index % MANIFESTATION_DESIRES.length;
    if (this.desireIndex < 0) this.desireIndex += MANIFESTATION_DESIRES.length;
    const label = MANIFESTATION_DESIRES[this.desireIndex];
    this.setIntentPreview(label);
    if (this.carouselLabel) {
      this.carouselLabel.text = truncateLabel(label, 12);
    }
  }

  getDesireIndex(): number {
    return this.desireIndex;
  }

  getSelectedDesire(): string {
    return MANIFESTATION_DESIRES[this.desireIndex];
  }

  setMicActive(active: boolean): void {
    if (this.micButtonLabel) {
      this.micButtonLabel.text = active ? "Listening…" : "Start Microphone";
    }
  }

  /** Panel height always reserves back row + intent row so nothing clips. */
  private estimatePanelHeight(_showBack: boolean): number {
    const p = this.cfg.panelPadding;
    const h =
      p * 2 +
      this.cfg.titleHeight +
      this.cfg.statusHeight +
      this.cfg.intentHeight +
      this.cfg.viewportHeight +
      this.cfg.backRowHeight +
      this.cfg.rowGap * 5;
    return Math.max(h, 12);
  }

  /** View stack starts at the TOP inside the viewport (viewport centered at 0). */
  private viewStack(_host: SceneObject): VStack {
    return new VStack(this.cfg.viewportHeight / 2 - 0.2);
  }

  private buildMainMenu(parent: SceneObject): SceneObject {
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

  private buildBreathingMenu(parent: SceneObject): SceneObject {
    return this.buildSimpleStartMenu(
      parent, "breathing", "Breathing",
      "Guided breath cycles with focused visuals.",
      () => this.callbacks?.onStartBreathing()
    );
  }

  private buildAcupressureMenu(parent: SceneObject): SceneObject {
    return this.buildSimpleStartMenu(
      parent, "acupressure", "Acupressure",
      "Three pressure points with guided imagery.",
      () => this.callbacks?.onStartAcupressure()
    );
  }

  private buildSimpleStartMenu(
    parent: SceneObject,
    name: string,
    title: string,
    blurb: string,
    onStart: () => void
  ): SceneObject {
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

  private buildChakraMenu(parent: SceneObject): SceneObject {
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

  private buildManifestationMenu(parent: SceneObject): SceneObject {
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

  private buildManifestListMenu(parent: SceneObject): SceneObject {
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
    const centerButton = centerBtn.createComponent(RectangleButton.getTypeName()) as RectangleButton;
    centerButton.size = new vec3(cw3, this.cfg.buttonHeight, 1);
    this.carouselLabel = this.label(centerBtn, truncateLabel(MANIFESTATION_DESIRES[0], 12), cw3 - 0.3);
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

  private buildManifestVoiceMenu(parent: SceneObject): SceneObject {
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
    const micButton = micBtn.createComponent(RectangleButton.getTypeName()) as RectangleButton;
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
  private buildBackRow(parent: SceneObject, _stack: VStack): SceneObject {
    const host = global.scene.createSceneObject("BackRow");
    host.setParent(parent);
    host.enabled = false;

    const panelH = this.estimatePanelHeight(true);
    const y = -panelH / 2 + this.cfg.panelPadding + this.cfg.backRowHeight / 2;
    host.getTransform().setLocalPosition(new vec3(0, y, 0));

    this.btnAt(host, "← Main Menu", this.cw, vec3.zero(), () => this.callbacks?.onBackToMain());
    return host;
  }

  private fontSize(role: TextRole): number {
    switch (role) {
      case "Headline1": return this.cfg.fontHeadline;
      case "Caption": return this.cfg.fontCaption;
      case "Button": return this.cfg.fontButton;
      default: return this.cfg.fontBody;
    }
  }

  private applyRole(t: Text, role: TextRole): void {
    t.size = this.fontSize(role);
    (t as Text & { weight?: number }).weight =
      role === "Headline1" || role === "Caption" ? 700 : 500;
  }

  private addTitle(parent: SceneObject, stack: VStack, text: string): void {
    const so = global.scene.createSceneObject("Title");
    so.setParent(parent);
    stack.place(so, this.cfg.titleHeight, this.cfg.rowGap);
    const t = so.createComponent("Component.Text") as Text;
    t.text = text;
    this.applyRole(t, "Headline1");
    t.horizontalAlignment = HorizontalAlignment.Left;
    t.verticalAlignment = VerticalAlignment.Center;
    t.depthTest = true;
  }

  private addTextBlock(
    parent: SceneObject,
    stack: VStack,
    name: string,
    text: string,
    h: number
  ): Text {
    const so = global.scene.createSceneObject(name);
    so.setParent(parent);
    stack.place(so, h, this.cfg.rowGap);
    const t = so.createComponent("Component.Text") as Text;
    t.text = text;
    this.applyRole(t, "Body");
    t.horizontalAlignment = HorizontalAlignment.Left;
    t.verticalAlignment = VerticalAlignment.Center;
    t.horizontalOverflow = HorizontalOverflow.Wrap;
    t.verticalOverflow = VerticalOverflow.Overflow;
    t.depthTest = true;
    return t;
  }

  private textRow(parent: SceneObject, stack: VStack, text: string, h: number, role: TextRole): void {
    const so = global.scene.createSceneObject("Txt");
    so.setParent(parent);
    stack.place(so, h, this.cfg.rowGap);
    const t = so.createComponent("Component.Text") as Text;
    t.text = text;
    this.applyRole(t, role);
    t.horizontalAlignment = HorizontalAlignment.Left;
    t.verticalAlignment = VerticalAlignment.Center;
    t.horizontalOverflow = HorizontalOverflow.Wrap;
    t.depthTest = true;
  }

  private btn(
    parent: SceneObject,
    stack: VStack,
    label: string,
    w: number,
    onClick: () => void
  ): void {
    const so = global.scene.createSceneObject("Btn_" + label.replace(/[\s←▶◀]/g, ""));
    so.setParent(parent);
    stack.place(so, this.cfg.buttonHeight, this.cfg.rowGap);
    this.setupButton(so, label, w, onClick);
  }

  private btnAt(
    parent: SceneObject,
    label: string,
    w: number,
    localPos: vec3,
    onClick: () => void
  ): void {
    const so = global.scene.createSceneObject("Btn_" + label.replace(/[\s←▶◀]/g, ""));
    so.setParent(parent);
    so.getTransform().setLocalPosition(localPos);
    this.setupButton(so, label, w, onClick);
  }

  private setupButton(so: SceneObject, label: string, w: number, onClick: () => void): void {
    const btn = so.createComponent(RectangleButton.getTypeName()) as RectangleButton;
    btn.size = new vec3(w, this.cfg.buttonHeight, 1);
    this.label(so, label, w - 0.35);
    btn.onTriggerUp.add(() => {
      print("[SanctumUI] " + label);
      onClick();
    });
  }

  private label(parent: SceneObject, text: string, _w: number): Text {
    const so = global.scene.createSceneObject("Lbl");
    so.setParent(parent);
    so.getTransform().setLocalPosition(new vec3(0, 0, 0.08));
    const t = so.createComponent("Component.Text") as Text;
    t.text = text;
    this.applyRole(t, "Button");
    t.horizontalAlignment = HorizontalAlignment.Center;
    t.verticalAlignment = VerticalAlignment.Center;
    t.depthTest = true;
    return t;
  }
}