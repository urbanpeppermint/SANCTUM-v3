import { Interactable } from "SpectaclesInteractionKit.lspkg/Components/Interaction/Interactable/Interactable";
import { InteractorEvent } from "SpectaclesInteractionKit.lspkg/Core/Interactor/InteractorEvent";
import { AudioButtonManager } from "../../../Packages/BUTTONS";
import {
  ACUPRESSURE_POINTS,
  BREATHING_IMAGE_PROMPTS,
  buildChakraDisplayText,
  buildChakraMeditationScript,
  buildChakraScopeCard,
  buildManifestationImagePrompt,
  CHAKRAS,
  MANIFESTATION_DESIRES,
  MANIFESTATION_SUGGESTIONS,
} from "./SanctumData";
import {
  AIService,
  buildManifestationScript,
  createVisionId,
  getManifestationFallbackScript,
  OUT_OF_SCOPE_REDIRECT,
  validateManifestIntent,
  VisionVault,
} from "./SanctumServices";
import { AcupressurePoint, ChakraData, HubView, PracticeMode, VisionEntry } from "./SanctumTypes";
import { SanctumUI } from "./SanctumUI";

@component
export class SanctumController extends BaseScriptComponent {
  @ui.separator
  @ui.group_start("Display")
  @input
  @allowUndefined
  textDisplay: Text;
  @input
  @allowUndefined
  private image: Image;
  @input
  @allowUndefined
  private spinner: SceneObject;
  @ui.group_end

  @ui.separator
  @ui.group_start("Voice Settings")
  @input
  @widget(new TextAreaWidget())
  private voiceInstructions: string =
    "Wise zen master or therapist tone. Calm, grounding, deeply peaceful voice. Speak slowly with intentional pauses between phrases.";
  @ui.group_end

  @ui.separator
  @ui.group_start("Practice Buttons")
  @input
  @allowUndefined
  private breathingButton: SceneObject;
  @input
  @allowUndefined
  private acupressureButton: SceneObject;
  @input
  @allowUndefined
  private manifestationButton: SceneObject;
  @input
  @allowUndefined
  private vaultButton: SceneObject;
  @input
  @label("Run On Tap")
  private startPracticeOnTap: boolean = false;
  @ui.group_end

  @ui.separator
  @ui.group_start("Chakra Buttons")
  @input
  @allowUndefined
  private rootChakraButton: SceneObject;
  @input
  @allowUndefined
  private sacralChakraButton: SceneObject;
  @input
  @allowUndefined
  private solarPlexusChakraButton: SceneObject;
  @input
  @allowUndefined
  private heartChakraButton: SceneObject;
  @input
  @allowUndefined
  private throatChakraButton: SceneObject;
  @input
  @allowUndefined
  private thirdEyeChakraButton: SceneObject;
  @input
  @allowUndefined
  private crownChakraButton: SceneObject;
  @ui.group_end

  @ui.separator
  @ui.group_start("Manifestation")
  @input
  @widget(new TextAreaWidget())
  @label("Custom Intent (optional)")
  private customManifestIntent: string = "";
  @input
  @allowUndefined
  private saveVisionButton: SceneObject;
  @input
  @allowUndefined
  private vaultNextButton: SceneObject;
  @input
  @allowUndefined
  private vaultPrevButton: SceneObject;
  @ui.group_end

  @ui.separator
  @ui.group_start("Chakra Audio")
  @input
  @label("AudioButtonManager host (BUTTONS)")
  @allowUndefined
  private audioManagerObject: SceneObject;
  @ui.group_end

  private gestureModule: GestureModule = require("LensStudio:GestureModule");
  private activeMode: PracticeMode = "idle";
  private sessionCancelled: boolean = false;
  private sessionId: number = 0;
  private currentAudioComponent: AudioComponent | null = null;
  private hubUI: SanctumUI | null = null;
  private pendingStartName: string = "";
  private pendingStartAction: (() => void) | null = null;
  private pendingNavigateView: HubView | null = null;

  private static readonly START_MODE: Record<string, PracticeMode> = {
    Breathing: "breathing",
    Acupressure: "acupressure",
    "Chakra Tuning": "chakra",
    Manifestation: "manifestation",
  };

  private preloadedTextures: Texture[] = [];
  private currentSessionPoints: AcupressurePoint[] = [];
  private vault: VisionVault = new VisionVault();
  private vaultBrowseIndex: number = 0;
  private pendingVision: { entry: VisionEntry; texture: Texture } | null = null;
  private suggestionIndex: number = 0;
  private lastGeneratedB64: string = "";
  private intentOverride: string = "";
  private visionMaterialReady: boolean = false;
  private asrModule: AsrModule = require("LensStudio:AsrModule");

  onAwake() {
    if (this.image) {
      this.prepareVisionMaterial(this.image);
      this.image.sceneObject.enabled = false;
    }
    if (this.spinner) this.spinner.enabled = false;

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
        if (this.startPracticeOnTap) this.handleBreathingPressed();
      });
    } else {
      this.gestureModule.getPinchDownEvent(GestureModule.HandType.Right).add(() => {
        if (this.startPracticeOnTap) this.handleBreathingPressed();
      });
    }

    if (this.textDisplay && this.textDisplay.sceneObject.name === "TextOutput") {
      this.textDisplay.sceneObject.enabled = false;
    }
  }

  /** Single status line — hub Status text and legacy TextOutput stay in sync. */
  private setStatus(message: string): void {
    if (!this.textDisplay) return;
    this.textDisplay.sceneObject.enabled = true;
    this.textDisplay.text = message;
  }

  private bindButton(buttonObj: SceneObject, callback: () => void) {
    if (!buttonObj) return;
    const interactable = buttonObj.getComponent(Interactable.getTypeName()) as Interactable;
    if (!interactable) return;
    interactable.onInteractorTriggerEnd.add((_event: InteractorEvent) => callback());
  }

  /** Wire hub panel for menu navigation. */
  public bindHubUI(ui: SanctumUI): void {
    this.hubUI = ui;
    this.suggestionIndex = 0;
    ui.setDesireIndex(0);
  }

  /** Wire the UIKit status line after the hub panel is built at runtime. */
  public bindStatusText(text: Text): void {
    if (text) this.textDisplay = text;
  }

  /** @deprecated Use bindHubUI desireText */
  public bindIntentPreview(text: Text): void {
    if (text && this.hubUI) this.hubUI.setDesirePreview(text.text);
  }

  /** Wire the spatial vision frame used by practices. */
  public bindVisionImage(image: Image): void {
    if (image) {
      this.image = image;
      this.visionMaterialReady = false;
      this.prepareVisionMaterial(image);
      image.sceneObject.enabled = false;
    }
  }

  private prepareVisionMaterial(image: Image): void {
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
  public bindIntentPreviewLegacy(_text: Text): void {
    // handled by bindHubUI
  }

  private tryStartSession(name: string, action: () => void): void {
    const targetMode = SanctumController.START_MODE[name];
    if (this.activeMode !== "idle") {
      if (targetMode === this.activeMode) return;
      if (this.pendingStartName === name && this.pendingStartAction) {
        this.cancelActiveSession();
        this.pendingStartName = "";
        this.pendingStartAction = null;
        action();
        return;
      }
      this.pendingStartName = name;
      this.pendingStartAction = action;
      this.setStatus(
        "Starting " + name + " will interrupt your " + this.activeMode + " session.\nTap Start again to confirm."
      );
      return;
    }
    this.pendingStartName = "";
    this.pendingStartAction = null;
    action();
  }

  private hubViewLabel(view: HubView): string {
    const labels: Partial<Record<HubView, string>> = {
      breathing: "Breathing Practice",
      acupressure: "Acupressure",
      chakra: "Chakra Tuning",
      manifestation: "Manifestation",
      manifestList: "Manifestation",
      manifestVoice: "Manifestation",
    };
    return labels[view] ?? view;
  }

  public hubNavigate(view: HubView): void {
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
      this.setStatus(
        "Opening " + this.hubViewLabel(view) + " will interrupt your " + this.activeMode + " session.\nTap the menu item again to confirm."
      );
      return;
    }

    this.pendingNavigateView = null;
    this.hubUI?.showView(view);
  }

  public hubBackToMain(): void {
    this.hubUI?.showView("main");
  }

  public hubStartBreathing(): void {
    this.tryStartSession("Breathing", () => this.handleBreathingPressed());
  }

  public hubStartAcupressure(): void {
    this.tryStartSession("Acupressure", () => this.handleAcupressurePressed());
  }

  public hubStartChakra(index: number): void {
    this.tryStartSession("Chakra Tuning", () => this.handleChakraPressed(index));
  }

  public hubOpenManifestList(): void {
    this.hubUI?.setDesireIndex(this.suggestionIndex);
  }

  public hubDesirePrev(): void {
    if (!this.hubUI) return;
    this.hubUI.setDesireIndex(this.hubUI.getDesireIndex() - 1);
    this.suggestionIndex = this.hubUI.getDesireIndex();
  }

  public hubDesireNext(): void {
    if (!this.hubUI) return;
    this.hubUI.setDesireIndex(this.hubUI.getDesireIndex() + 1);
    this.suggestionIndex = this.hubUI.getDesireIndex();
  }

  public hubDesireSelect(): void {
    this.suggestionIndex = this.hubUI?.getDesireIndex() ?? 0;
    this.intentOverride = "";
    this.setStatus(
      "Selected: \"" + this.getCurrentManifestIntent() + "\"\nTap Generate Visualization."
    );
  }

  public hubOpenManifestVoice(): void {
    this.intentOverride = "";
    this.setStatus("Tap Start Microphone and speak.\nOr use Type Instead.");
  }

  public hubTypeIntent(): void {
    this.startTypeIntentInput();
  }

  public hubBeginManifestation(): void {
    this.tryStartSession("Manifestation", () => this.handleManifestationPressed());
  }

  public hubStartVoiceCapture(): void {
    this.startVoiceIntentInput();
  }

  private getAudioManager(): AudioButtonManager | null {
    if (!this.audioManagerObject) return null;
    return this.audioManagerObject.getComponent(
      AudioButtonManager.getTypeName()
    ) as AudioButtonManager;
  }

  private stopChakraAudio(): void {
    const mgr = this.getAudioManager();
    if (mgr) mgr.stopAllAudio();
  }

  private cancelActiveSession() {
    this.sessionCancelled = true;
    this.sessionId++;
    this.activeMode = "idle";
    this.preloadedTextures = [];
    this.pendingVision = null;

    if (this.currentAudioComponent) {
      try {
        this.currentAudioComponent.stop(true);
      } catch (_) {}
      this.currentAudioComponent = null;
    }

    this.stopChakraAudio();

    if (this.image) this.image.sceneObject.enabled = false;
    if (this.spinner) this.spinner.enabled = false;
    print("Active session cancelled — all buttons remain active");
  }

  /** Start a exclusive session; cancels any in-flight work from a prior session. */
  private startSession(mode: PracticeMode): number {
    if (this.activeMode !== "idle") {
      this.cancelActiveSession();
    }
    this.sessionCancelled = false;
    this.sessionId++;
    this.activeMode = mode;
    return this.sessionId;
  }

  private isSessionActive(sessionId: number): boolean {
    return this.sessionId === sessionId && !this.sessionCancelled;
  }

  private isCancelled(): boolean {
    return this.sessionCancelled;
  }

  private showTexture(texture: Texture) {
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

  private hideImage() {
    if (this.image) this.image.sceneObject.enabled = false;
  }

  private setSpinner(enabled: boolean) {
    if (this.spinner) this.spinner.enabled = enabled;
  }

  private playVoice(script: string) {
    AIService.doVoiceGuidance(
      script,
      this.voiceInstructions,
      this,
      () => this.isCancelled(),
      (audio) => {
        this.currentAudioComponent = audio;
      }
    );
  }

  private delayedCallback(delayTime: number, callback: () => void) {
    const evt = this.createEvent("DelayedCallbackEvent");
    evt.bind(callback);
    evt.reset(delayTime);
  }

  private playChakraAudio(chakraIndex: number): void {
    const mgr = this.getAudioManager();
    if (mgr) mgr.playChakraTrack(chakraIndex);
  }

  // ─── Breathing ─────────────────────────────────────────

  private handleBreathingPressed() {
    const session = this.startSession("breathing");
    this.setStatus("Preparing your breathing practice…");
    this.setSpinner(true);

    const prompt = BREATHING_IMAGE_PROMPTS[Math.floor(Math.random() * BREATHING_IMAGE_PROMPTS.length)];

    AIService.generateTexture(prompt, () => !this.isSessionActive(session))
      .then((texture) => {
        if (!this.isSessionActive(session)) return;
        this.preloadedTextures = [texture];
        this.setSpinner(false);
        this.generateBreathingScriptAndStart(session);
      })
      .catch((error) => {
        print("Breathing image preload failed: " + error);
        this.setSpinner(false);
        if (!this.isSessionActive(session)) return;
        this.preloadedTextures = [];
        this.generateBreathingScriptAndStart(session);
      });
  }

  private generateBreathingScriptAndStart(session: number) {
    const system = `You are a meditation guide creating a 1-minute breathing practice script.
Structure: brief welcome, 3 cycles inhale 4s hold 4s exhale 6s, brief closing.
Use calming language with pauses "..." and gentle counting. ~50-55 seconds total.`;

    AIService.chatCompletion(system, "Create a calming 1-minute guided breathing practice.", () => !this.isSessionActive(session))
      .then((script) => {
        if (!this.isSessionActive(session)) return;
        const finalScript = script || this.getFallbackBreathingScript();
        if (this.preloadedTextures.length > 0) this.showTexture(this.preloadedTextures[0]);
        this.setStatus("Follow the guided voice… breathe with the rhythm.");
        this.playVoice(finalScript);
        this.delayedCallback(55, () => {
          if (!this.isSessionActive(session)) return;
          this.setStatus("Practice complete. Notice how you feel.");
          this.activeMode = "idle";
          this.delayedCallback(6, () => {
            if (this.activeMode === "idle") this.hideImage();
          });
        });
      })
      .catch(() => {
        if (!this.isSessionActive(session)) return;
        if (this.preloadedTextures.length > 0) this.showTexture(this.preloadedTextures[0]);
        const fallback = this.getFallbackBreathingScript();
        this.setStatus("Follow the guided voice… breathe with the rhythm.");
        this.playVoice(fallback);
        this.delayedCallback(55, () => {
          if (!this.isSessionActive(session)) return;
          this.setStatus("Practice complete. Notice how you feel.");
          this.activeMode = "idle";
        });
      });
  }

  private getFallbackBreathingScript(): string {
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

  private handleAcupressurePressed() {
    const session = this.startSession("acupressure");
    this.setStatus("Preparing Acupressure Session…");
    this.setSpinner(true);

    const selected = this.getRandomPoints(3);
    this.currentSessionPoints = selected;
    this.preloadAcupressureImages(session, selected, 0, []);
  }

  private preloadAcupressureImages(
    session: number,
    points: AcupressurePoint[],
    index: number,
    textures: Texture[]
  ) {
    if (!this.isSessionActive(session)) return;
    if (index >= points.length) {
      this.preloadedTextures = textures;
      this.setSpinner(false);
      this.startAcupressureSession(session);
      return;
    }

    this.setStatus("Preparing point " + (index + 1) + " of " + points.length + "…");

    AIService.generateTexture(points[index].imagePrompt, () => !this.isSessionActive(session))
      .then((texture) => {
        if (!this.isSessionActive(session)) return;
        textures.push(texture);
        this.preloadAcupressureImages(session, points, index + 1, textures);
      })
      .catch(() => {
        textures.push(null);
        this.preloadAcupressureImages(session, points, index + 1, textures);
      });
  }

  private startAcupressureSession(session: number) {
    const points = this.currentSessionPoints;
    const pointBlock = points
      .map((p, i) => `Point ${i + 1}: ${p.name}\n  Location: ${p.location}\n  Technique: ${p.instruction}`)
      .join("\n\n");

    const system = `You are a calming acupressure guide. Create a 2-minute guided session.
For each point (~35s): name, location, technique, breathing, benefit. Pauses with "..."\n\nPoints:\n${pointBlock}`;

    AIService.chatCompletion(system, "Create a calming acupressure session for stress relief.", () => !this.isSessionActive(session))
      .then((script) => {
        if (!this.isSessionActive(session)) return;
        this.playVoice(script || this.getFallbackAcupressureScript());
        this.runAcupressureSequence(session, 0);
      })
      .catch(() => {
        if (!this.isSessionActive(session)) return;
        this.playVoice(this.getFallbackAcupressureScript());
        this.runAcupressureSequence(session, 0);
      });
  }

  private getFallbackAcupressureScript(): string {
    this.currentSessionPoints = ACUPRESSURE_POINTS.slice(0, 3);
    return `Welcome to your stress-relief acupressure session. Take one deep breath in... and slowly let it out.
We will work through three powerful acupressure points to melt away tension.
First, He Gu, LI4. Find the fleshy web between your thumb and index finger. Pinch firmly... breathe deeply... and release.
Next, Nei Guan, PC6. Two finger-widths below the wrist crease... press firmly... breathe... and release.
Finally, Yin Tang. Between your eyebrows... gentle circles... breathe slowly... and release.
Take one final deep breath in... and let it all go.`;
  }

  private getRandomPoints(count: number): AcupressurePoint[] {
    const shuffled = [...ACUPRESSURE_POINTS].sort(() => Math.random() - 0.5);
    return shuffled.slice(0, Math.min(count, shuffled.length));
  }

  private runAcupressureSequence(session: number, index: number) {
    if (!this.isSessionActive(session)) return;
    const points = this.currentSessionPoints;

    if (index >= points.length) {
      this.setStatus("Session complete. Notice how your body feels.");
      this.activeMode = "idle";
      this.delayedCallback(6, () => {
        if (this.activeMode === "idle") this.hideImage();
      });
      return;
    }

    const point = points[index];
    this.setStatus(
      "Point " + (index + 1) + " of " + points.length + ": " + point.name + "\n" +
      point.location + "\n\n" + point.instruction
    );

    if (this.preloadedTextures[index]) {
      this.showTexture(this.preloadedTextures[index]);
    } else {
      this.hideImage();
    }

    this.delayedCallback(35, () => this.runAcupressureSequence(session, index + 1));
  }

  // ─── Chakra Tuning ─────────────────────────────────────

  private handleChakraPressed(chakraIndex: number) {
    const session = this.startSession("chakra");
    const chakra = CHAKRAS[chakraIndex];
    const script = buildChakraMeditationScript(chakra);

    this.setStatus(buildChakraDisplayText(chakra));
    this.hideImage();
    this.playChakraAudio(chakraIndex);
    this.playVoice(script);

    this.delayedCallback(50, () => {
      if (!this.isSessionActive(session)) return;
      this.setStatus(chakra.name + " balanced.\n" + chakra.affirmation);
      this.activeMode = "idle";
    });
  }

  private getFallbackChakraScript(chakra: ChakraData): string {
    return buildChakraMeditationScript(chakra);
  }

  // ─── Manifestation ─────────────────────────────────────

  private getCurrentManifestIntent(): string {
    if (this.intentOverride && this.intentOverride.trim().length >= 3) {
      return this.intentOverride.trim();
    }
    if (this.customManifestIntent && this.customManifestIntent.trim().length >= 10) {
      return this.customManifestIntent.trim();
    }
    if (this.hubUI) return this.hubUI.getSelectedDesire();
    return MANIFESTATION_DESIRES[this.suggestionIndex % MANIFESTATION_DESIRES.length];
  }

  public setManifestIntent(text: string): void {
    this.intentOverride = text.trim();
    if (this.hubUI) this.hubUI.setDesirePreview(text.trim());
  }

  private updateIntentPreview(): void {
    if (this.hubUI) this.hubUI.setDesirePreview(this.getCurrentManifestIntent());
  }

  /** On-device ASR for voice intent (Spectacles device; limited in editor preview). */
  public startVoiceIntentInput(): void {
    print("[Sanctum] Voice capture requested");
    this.hubUI?.setMicActive(true);
    this.setStatus("Microphone active — speak now.");
    try {
      const options = AsrModule.AsrTranscriptionOptions.create();
      options.silenceUntilTerminationMs = 1500;
      options.mode = AsrModule.AsrMode.HighAccuracy;
      options.onTranscriptionUpdateEvent.add((event: AsrModule.TranscriptionUpdateEvent) => {
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
      options.onTranscriptionErrorEvent.add((code: AsrModule.AsrStatusCode) => {
        print("[Sanctum] ASR error code: " + code);
        this.hubUI?.setMicActive(false);
        this.setStatus(
          "Microphone unavailable in preview.\nUse Type Instead, or test on Spectacles."
        );
      });
      this.asrModule.startTranscribing(options);
      print("[Sanctum] ASR transcribing started");
    } catch (e) {
      print("[Sanctum] ASR start failed: " + e);
      this.hubUI?.setMicActive(false);
      this.setStatus("Microphone unavailable.\nUse Type Instead.");
    }
  }

  /** AR keyboard for typed manifestation intent (device; limited in preview). */
  public startTypeIntentInput(): void {
    print("[Sanctum] Type intent input started");
    try {
      require("LensStudio:TextInputModule");
      const options = new TextInputSystem.KeyboardOptions();
      options.enablePreview = true;
      options.keyboardType = TextInputSystem.KeyboardType.Text;
      options.returnKeyType = TextInputSystem.ReturnKeyType.Done;
      options.onTextChanged = (text: string) => {
        if (text && text.trim().length >= 3) {
          this.setManifestIntent(text);
        }
      };
      options.onReturnKeyPressed = () => {
        global.textInputSystem.dismissKeyboard();
        const intent = this.getCurrentManifestIntent();
        this.setStatus("Intent set.\n\"" + intent + "\"\nTap Generate Visualization.");
      };
      options.onError = (_code: number, description: string) => {
        print("[Sanctum] Keyboard error: " + description);
        this.setStatus("Keyboard unavailable in preview.\nBrowse intentions from the list.");
      };
      global.textInputSystem.requestKeyboard(options);
      this.setStatus("Type your intention…\nPress Done when finished.");
    } catch (e) {
      print("[Sanctum] Keyboard failed: " + e);
      this.setStatus("Keyboard unavailable.\nBrowse intentions from the list.");
    }
  }

  private handleManifestationPressed() {
    const intent = this.getCurrentManifestIntent();
    const session = this.startSession("manifestation");
    this.pendingVision = null;

    this.setStatus("Manifestation\n\n\"" + intent + "\"\n\nPainting your vision…");
    this.setSpinner(true);
    this.hideImage();

    validateManifestIntent(intent, () => !this.isSessionActive(session))
      .then(({ summary, inScope }) => {
        if (!this.isSessionActive(session)) return;

        if (!inScope) {
          this.setSpinner(false);
          this.setStatus(OUT_OF_SCOPE_REDIRECT + "\n\nPick another desire from the carousel.");
          this.activeMode = "idle";
          return;
        }

        const imagePrompt = buildManifestationImagePrompt(intent);

        AIService.generateImage(imagePrompt, () => !this.isSessionActive(session))
          .then(({ texture, b64 }) => {
            if (!this.isSessionActive(session)) return;
            this.lastGeneratedB64 = b64;
            this.showTexture(texture);
            this.setSpinner(false);

            const entry: VisionEntry = {
              id: createVisionId(),
              createdAt: Date.now(),
              intentText: intent,
              scriptSummary: summary,
              imageB64: b64,
            };
            this.pendingVision = { entry, texture };
            this.activeMode = "idle";

            this.setStatus(
              "Your Vision\n\n\"" + intent + "\"\n\nTap Save · Vault to browse."
            );

            const scriptSystem = buildManifestationScript(intent, summary);
            return AIService.chatCompletion(
              scriptSystem,
              "Create the guided visualization script.",
              () => !this.isSessionActive(session)
            )
              .catch((err) => {
                print("[Sanctum] Script chat failed, using fallback: " + err);
                return "";
              })
              .then((script) => {
                if (!this.isSessionActive(session)) return;
                const finalScript = script || getManifestationFallbackScript(intent, summary);
                this.playVoice(finalScript);

                this.delayedCallback(70, () => {
                  if (!this.isSessionActive(session)) return;
                  this.setStatus(
                    "Vision complete.\n\nSave to Vault · Shuffle for a new intent · or choose another practice."
                  );
                  this.activeMode = "idle";
                });
              });
          })
          .catch((error) => {
            print("Manifestation error: " + error);
            if (!this.isSessionActive(session)) return;
            this.setSpinner(false);
            this.setStatus("Image unavailable.\nHere is a gentle guide instead.");
            this.playVoice(getManifestationFallbackScript(intent, summary));
            this.activeMode = "idle";
          });
      })
      .catch(() => {
        if (!this.isSessionActive(session)) return;
        this.setSpinner(false);
        this.activeMode = "idle";
      });
  }

  private handleShuffleIntentPressed() {
    if (this.activeMode !== "idle") return;
    this.suggestionIndex = (this.suggestionIndex + 1) % MANIFESTATION_SUGGESTIONS.length;
    this.updateIntentPreview();
    this.setStatus("Intent selected.\nTap Begin Vision when ready.");
  }

  private handleSaveVisionPressed() {
    print("[Sanctum] Save pressed, pending=" + (this.pendingVision != null));
    if (!this.pendingVision) {
      this.setStatus("No vision to save.\nUse Begin Vision first, then tap Save.");
      return;
    }
    this.vault.addEntry(this.pendingVision.entry, this.pendingVision.texture);
    this.setStatus(
      "Saved to Vision Vault.\n\"" + this.pendingVision.entry.intentText + "\"\n\n" +
      this.vault.getCount() + " vision(s) stored.\nTap Vault to browse."
    );
    this.pendingVision = null;
  }

  // ─── Vision Vault ──────────────────────────────────────

  private handleVaultPressed() {
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

  private handleVaultNext() {
    print("[Sanctum] Vault Next");
    const entries = this.vault.getEntries();
    if (entries.length === 0) return;
    this.vaultBrowseIndex = (this.vaultBrowseIndex + 1) % entries.length;
    this.showVaultEntry(this.vaultBrowseIndex);
  }

  private handleVaultPrev() {
    print("[Sanctum] Vault Prev");
    const entries = this.vault.getEntries();
    if (entries.length === 0) return;
    this.vaultBrowseIndex = (this.vaultBrowseIndex - 1 + entries.length) % entries.length;
    this.showVaultEntry(this.vaultBrowseIndex);
  }

  private showVaultEntry(index: number) {
    const entries = this.vault.getEntries();
    if (entries.length === 0) return;

    const entry = entries[index];
    this.setStatus(
      "Vision Vault · " + (index + 1) + " of " + entries.length + "\n\n" +
      "\"" + entry.intentText + "\"\n\n" + entry.scriptSummary
    );

    this.vault.decodeEntryTexture(
      entry,
      (texture) => this.showTexture(texture),
      () => this.hideImage()
    );
  }

  // ─── Public API (legacy + hub) ─────────────────────────

  public triggerBreathingPractice() {
    this.hubStartBreathing();
  }

  public triggerAcupressureSession() {
    this.hubStartAcupressure();
  }

  public triggerManifestation() {
    this.hubBeginManifestation();
  }

  public triggerChakra(index: number) {
    this.hubStartChakra(index);
  }

  public openVault() {
    this.handleVaultPressed();
  }

  public saveVision() {
    this.handleSaveVisionPressed();
  }

  public vaultNext() {
    this.handleVaultNext();
  }

  public vaultPrev() {
    this.handleVaultPrev();
  }

  public resetPractice() {
    this.cancelActiveSession();
    this.sessionCancelled = false;
    this.textDisplay.text = "Ready to begin your wellness session";
  }
}
