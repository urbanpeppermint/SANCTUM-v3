import { SanctumController } from "./SanctumController";
import { DEFAULT_HUB_LAYOUT, SanctumHubLayoutConfig } from "./SanctumHubLayout";
import { SanctumUI } from "./SanctumUI";

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
@component
export class SanctumMainManager extends BaseScriptComponent {
  @ui.separator
  @ui.group_start("Core")
  @input
  @label("Sanctum Controller")
  @allowUndefined
  private sanctumControllerObject: SceneObject;
  @input
  @label("Audio Manager (BUTTONS)")
  @allowUndefined
  private audioManagerObject: SceneObject;
  @input
  @allowUndefined
  private spinner: SceneObject;
  @input
  @allowUndefined
  private visionImage: Image;
  @ui.group_end

  @ui.separator
  @ui.group_start("Hub Placement")
  @input
  @label("Panel position (cm, camera-local)")
  private panelPosition: vec3 = new vec3(28, 8, -115);
  @input
  @label("Hub parent (scene object)")
  @hint("Drag Camera here. Defaults to Camera when empty.")
  @allowUndefined
  private hubParentObject: SceneObject;
  @input
  @label("Hub anchor (optional)")
  @hint("Use this object's local position instead of Panel position.")
  @allowUndefined
  private hubAnchorObject: SceneObject;
  @input
  @label("Panel width (cm)")
  private panelWidth: number = 28;
  @input
  @label("Panel padding (cm)")
  private panelPadding: number = 1.4;
  @input
  @label("Button height (cm)")
  private buttonHeight: number = 3.8;
  @input
  @label("Row gap (cm)")
  private rowGap: number = 0.65;
  @input
  @label("View area height (cm)")
  private viewportHeight: number = 18;
  @ui.group_end

  @ui.separator
  @ui.group_start("Hub Typography (cm em-square)")
  @input
  private fontHeadline: number = 46;
  @input
  private fontBody: number = 32;
  @input
  private fontCaption: number = 30;
  @input
  private fontButton: number = 32;
  @ui.group_end

  @ui.separator
  @ui.group_start("Vision Display")
  @input
  @label("Vision local position (cm)")
  private visionLocalPosition: vec3 = new vec3(-24, 6, -95);
  @input
  @label("Vision scale")
  private visionScale: vec3 = new vec3(36, 36, 1);
  @ui.group_end

  @ui.separator
  @ui.group_start("Legacy Menu (hide after hub builds)")
  @input
  @allowUndefined
  private legacyBreathingButton: SceneObject;
  @input
  @allowUndefined
  private legacyAcupressureButton: SceneObject;
  @input
  @allowUndefined
  private legacyManifestButton: SceneObject;
  @input
  @label("Hide legacy ground lotus buttons")
  private hideLegacyMenu: boolean = true;
  @ui.group_end

  private controller: SanctumController | null = null;
  private ui: SanctumUI | null = null;
  private hubInitFramesRemaining: number = -1;

  onAwake(): void {
    this.createEvent("OnStartEvent").bind(() => this.scheduleInitialize());
    this.createEvent("UpdateEvent").bind(() => this.tickHubInit());
  }

  /** Wait several frames so UIKit components on new objects are fully awake. */
  private scheduleInitialize(): void {
    this.hideLegacyFloatingText();
    this.hideLegacyButtons();
    this.autoWireReferences();

    if (!this.sanctumControllerObject) {
      print("SanctumMainManager: sanctumControllerObject not set");
      return;
    }

    this.controller = this.sanctumControllerObject.getComponent(
      SanctumController.getTypeName()
    ) as SanctumController;

    if (!this.controller) {
      print("SanctumMainManager: SanctumController component missing");
      return;
    }

    this.hubInitFramesRemaining = 8;
  }

  private tickHubInit(): void {
    if (this.hubInitFramesRemaining < 0) return;
    this.hubInitFramesRemaining--;
    if (this.hubInitFramesRemaining === 0) {
      this.hubInitFramesRemaining = -1;
      this.finishInitialize();
    }
  }

  private finishInitialize(): void {
    if (!this.controller) return;

    try {
      this.buildHub();
      this.hideLegacyButtons();
      this.hideLegacyFloatingText();
      print("SanctumMainManager: hub ready");
    } catch (error) {
      print("SanctumMainManager: hub build failed — " + error);
    }
  }

  /** Resolve common scene refs by name when Inspector inputs are empty. */
  private autoWireReferences(): void {
    if (!this.sanctumControllerObject) {
      if (this.sceneObject.getComponent(SanctumController.getTypeName())) {
        this.sanctumControllerObject = this.sceneObject;
      } else {
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
      const imageObj =
        this.findChildByName(this.sanctumControllerObject, "ImageOutputExample") ??
        this.findChildByName(this.sanctumControllerObject, "Image");
      if (imageObj) {
        this.visionImage = imageObj.getComponent("Component.Image") as Image;
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
      if (acu) this.legacyAcupressureButton = acu;
    }
    const lotusButtons = this.findAllByName("LOD0_LotusFlower");
    for (let i = 0; i < lotusButtons.length; i++) {
      const lotus = lotusButtons[i];
      if (!this.legacyBreathingButton) this.legacyBreathingButton = lotus;
      else if (!this.legacyAcupressureButton && lotus !== this.legacyBreathingButton) {
        this.legacyAcupressureButton = lotus;
      }
    }
  }

  private findSceneObjectByName(name: string): SceneObject | null {
    const roots = global.scene.getRootObjectsCount();
    for (let i = 0; i < roots; i++) {
      const hit = this.findByNameRecursive(global.scene.getRootObject(i), name);
      if (hit) return hit;
    }
    return null;
  }

  private findAllByName(name: string): SceneObject[] {
    const out: SceneObject[] = [];
    const roots = global.scene.getRootObjectsCount();
    for (let i = 0; i < roots; i++) {
      this.collectByNameRecursive(global.scene.getRootObject(i), name, out);
    }
    return out;
  }

  private findByNameRecursive(node: SceneObject, name: string): SceneObject | null {
    if (node.name === name) return node;
    const count = node.getChildrenCount();
    for (let i = 0; i < count; i++) {
      const hit = this.findByNameRecursive(node.getChild(i), name);
      if (hit) return hit;
    }
    return null;
  }

  private collectByNameRecursive(node: SceneObject, name: string, out: SceneObject[]): void {
    if (node.name === name) out.push(node);
    const count = node.getChildrenCount();
    for (let i = 0; i < count; i++) {
      this.collectByNameRecursive(node.getChild(i), name, out);
    }
  }

  private findChildByName(parent: SceneObject, name: string): SceneObject | null {
    return this.findByNameRecursive(parent, name);
  }

  private buildHub(): void {
    const existing = this.findChildByName(this.sceneObject, "SanctumHub");
    if (existing) {
      existing.destroy();
    }

    this.ui = new SanctumUI(
      this.resolveHubParent(),
      this.resolveHubLocalPosition(),
      this.buildLayoutConfig()
    );

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

  private buildLayoutConfig(): SanctumHubLayoutConfig {
    const d = DEFAULT_HUB_LAYOUT;
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

  private positiveOr(value: number, fallback: number): number {
    return value > 0.001 ? value : fallback;
  }

  private isZeroVec3(v: vec3): boolean {
    return Math.abs(v.x) < 0.001 && Math.abs(v.y) < 0.001 && Math.abs(v.z) < 0.001;
  }

  private nonZeroVec3(v: vec3, fallback: vec3): vec3 {
    return this.isZeroVec3(v) ? fallback : v;
  }

  /** Reparent legacy ImageOutputExample — bare runtime Images have no material (clone crash). */
  private createVisionDisplay(parent: SceneObject): Image | null {
    const cfg = this.buildLayoutConfig();
    const existing = this.findChildByName(parent, "SanctumVisionDisplay");
    if (existing) existing.destroy();

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
      const img = legacyObj.getComponent("Component.Image") as Image;
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
  private resolveHubParent(): SceneObject {
    if (this.hubParentObject) return this.hubParentObject;
    return (
      this.findSceneObjectByName("Camera") ??
      this.findSceneObjectByName("Camera Object") ??
      this.sceneObject
    );
  }

  private resolveHubLocalPosition(): vec3 {
    if (this.hubAnchorObject) {
      return this.hubAnchorObject.getTransform().getLocalPosition();
    }
    if (!this.isZeroVec3(this.panelPosition)) {
      return this.panelPosition;
    }
    return DEFAULT_HUB_LAYOUT.hubLocalPosition;
  }

  private hideLegacyButtons(): void {
    if (!this.hideLegacyMenu) return;
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
  private hideLegacyFloatingText(): void {
    const legacy = this.findChildByName(this.sceneObject, "TextOutput");
    if (legacy) legacy.enabled = false;
  }

  private setHidden(obj: SceneObject): void {
    if (obj) obj.enabled = false;
  }
}
