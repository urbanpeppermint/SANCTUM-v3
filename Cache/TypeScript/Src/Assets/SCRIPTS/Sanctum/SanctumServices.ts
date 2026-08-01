import { GoogleGenAITypes } from "RemoteServiceGateway.lspkg/HostedExternal/GoogleGenAITypes";
import { Imagen } from "RemoteServiceGateway.lspkg/HostedExternal/Imagen";
import { OpenAI } from "RemoteServiceGateway.lspkg/HostedExternal/OpenAI";
import { ChakraData, VisionEntry } from "./SanctumTypes";
import { OUT_OF_SCOPE_REDIRECT } from "./SanctumData";

const VAULT_STORAGE_KEY = "sanctum_vision_vault_v1";
const MAX_VAULT_ENTRIES = 12;

/** RSG-supported Imagen model (OpenAI DALL-E models are not on the gateway). */
const IMAGEN_MODEL = "imagen-3.0-generate-002";
/** Matches ExampleOAICalls — gemini-2.0-flash 404s on this RSG gateway. */
const OPENAI_CHAT_MODEL = "gpt-4.1-nano";

export interface GeneratedImage {
  texture: Texture;
  b64: string;
}

export class AIService {
  /** Text-to-image via Google Imagen — the reliable RSG path. */
  static generateImage(prompt: string, sessionCancelled: () => boolean): Promise<GeneratedImage> {
    return new Promise((resolve, reject) => {
      print("[Sanctum] Imagen generate: " + prompt.substring(0, 80) + "…");

      const request: GoogleGenAITypes.Imagen.ImagenRequest = {
        model: IMAGEN_MODEL,
        body: {
          parameters: {
            sampleCount: 1,
            addWatermark: false,
            aspectRatio: "1:1",
            enhancePrompt: true,
            language: "en",
          },
          instances: [{ prompt }],
        },
      };

      Imagen.generateImage(request)
        .then((response) => {
          if (sessionCancelled()) {
            reject("Session cancelled");
            return;
          }
          const predictions = response?.predictions;
          if (!predictions || predictions.length === 0) {
            reject("No image in Imagen response");
            return;
          }
          const b64 = predictions[0].bytesBase64Encoded;
          if (!b64) {
            reject("No base64 data in Imagen prediction");
            return;
          }
          Base64.decodeTextureAsync(
            b64,
            (texture) => {
              print("[Sanctum] Imagen image decoded OK");
              resolve({ texture, b64 });
            },
            () => reject("Failed to decode Imagen texture")
          );
        })
        .catch((error) => {
          print("[Sanctum] Imagen error: " + error);
          reject("Image generation error: " + error);
        });
    });
  }

  static generateTexture(prompt: string, sessionCancelled: () => boolean): Promise<Texture> {
    return AIService.generateImage(prompt, sessionCancelled).then((result) => result.texture);
  }

  /** Guided voice — still uses OpenAI TTS (works on RSG). */
  static doVoiceGuidance(
    script: string,
    voiceInstructions: string,
    host: BaseScriptComponent,
    sessionCancelled: () => boolean,
    onAudioCreated: (audio: AudioComponent) => void
  ): void {
    OpenAI.speech({
      model: "gpt-4o-mini-tts",
      input: script,
      voice: "coral",
      instructions: voiceInstructions,
    })
      .then((response) => {
        if (sessionCancelled()) return;
        const aud = host.sceneObject.createComponent("AudioComponent") as AudioComponent;
        aud.audioTrack = response;
        aud.play(1);
        onAudioCreated(aud);
      })
      .catch((error) => {
        print("Voice error: " + error);
      });
  }

  /** Text/scripts via OpenAI — matches RSG ExampleOAICalls (Gemini chat 404s here). */
  static chatCompletion(system: string, user: string, sessionCancelled: () => boolean): Promise<string> {
    return new Promise((resolve, reject) => {
      OpenAI.chatCompletions({
        model: OPENAI_CHAT_MODEL,
        messages: [
          { role: "system", content: system },
          { role: "user", content: user },
        ],
        temperature: 0.7,
      })
        .then((response) => {
          if (sessionCancelled()) {
            reject("Session cancelled");
            return;
          }
          const content = response.choices[0].message.content;
          resolve(content && content.trim() !== "" ? content : "");
        })
        .catch((error) => {
          print("[Sanctum] OpenAI chat error: " + error);
          reject("Chat error: " + error);
        });
    });
  }
}

export class VisionVault {
  private entries: VisionEntry[] = [];
  private loadedTextures: Map<string, Texture> = new Map();

  constructor() {
    this.loadFromStorage();
  }

  getEntries(): VisionEntry[] {
    return [...this.entries];
  }

  getCount(): number {
    return this.entries.length;
  }

  addEntry(entry: VisionEntry, texture: Texture): void {
    this.entries.unshift(entry);
    this.loadedTextures.set(entry.id, texture);
    if (this.entries.length > MAX_VAULT_ENTRIES) {
      const removed = this.entries.pop();
      if (removed) this.loadedTextures.delete(removed.id);
    }
    this.saveToStorage();
  }

  getTexture(id: string): Texture | null {
    return this.loadedTextures.get(id) || null;
  }

  getEntry(id: string): VisionEntry | null {
    return this.entries.find((e) => e.id === id) || null;
  }

  deleteEntry(id: string): void {
    this.entries = this.entries.filter((e) => e.id !== id);
    this.loadedTextures.delete(id);
    this.saveToStorage();
  }

  decodeEntryTexture(entry: VisionEntry, onReady: (texture: Texture) => void, onError: () => void): void {
    const cached = this.loadedTextures.get(entry.id);
    if (cached) {
      onReady(cached);
      return;
    }
    if (!entry.imageB64) {
      onError();
      return;
    }
    Base64.decodeTextureAsync(
      entry.imageB64,
      (texture) => {
        this.loadedTextures.set(entry.id, texture);
        onReady(texture);
      },
      onError
    );
  }

  private loadFromStorage(): void {
    try {
      const store = global.persistentStorageSystem.store;
      const raw = store.getString(VAULT_STORAGE_KEY);
      if (!raw) return;
      const parsed = JSON.parse(raw) as VisionEntry[];
      if (Array.isArray(parsed)) {
        this.entries = parsed.slice(0, MAX_VAULT_ENTRIES);
      }
    } catch (e) {
      print("[VisionVault] load error: " + e);
    }
  }

  private saveToStorage(): void {
    try {
      const store = global.persistentStorageSystem.store;
      store.putString(VAULT_STORAGE_KEY, JSON.stringify(this.entries));
    } catch (e) {
      print("[VisionVault] save error: " + e);
    }
  }
}

export function createVisionId(): string {
  return "vision_" + Date.now().toString(36) + "_" + Math.floor(Math.random() * 10000).toString();
}

export function validateManifestIntent(
  intent: string,
  _sessionCancelled: () => boolean
): Promise<{ summary: string; inScope: boolean }> {
  // Intent comes from curated shuffle list or Inspector — no blocking API gate before Imagen.
  return Promise.resolve({ summary: intent, inScope: true });
}

/** @deprecated Manifestation no longer maps intents to chakras */
export function classifyChakraForIntent(
  intent: string,
  chakras: ChakraData[],
  sessionCancelled: () => boolean
): Promise<{ chakra: ChakraData; summary: string; inScope: boolean }> {
  return validateManifestIntent(intent, sessionCancelled).then(({ summary, inScope }) => ({
    chakra: chakras[3],
    summary,
    inScope,
  }));
}

export function buildManifestationScript(intent: string, summary: string): string {
  return `You are Sanctum's manifestation guide. Create a 60-second guided visualization script.

User intention: ${intent}
Feeling focus: ${summary}

Structure:
1. Welcome and settle (5s)
2. Clarify the feeling-state, not the outcome (10s)
3. Body awareness — where this feeling lives in the body (15s)
4. Visualize symbolic imagery representing this feeling (20s)
5. Gratitude anchor and gentle close (10s)

Rules:
- Never promise external outcomes ("you will get…")
- No medical, legal, or financial advice
- Do NOT mention chakras, energy centers, or frequencies
- Speak slowly with pauses "..."
- Warm, nurturing tone`;
}

export function getManifestationFallbackScript(intent: string, summary: string): string {
  return `Welcome. Take one slow breath in… and let it go.

You are planting a seed of intention — not demanding an outcome, but inviting a feeling to grow.

Your focus today: ${summary}.

Bring your attention to your body… notice where this feeling might already live… even as a whisper.

Let your inner vision shape a symbol of ${intent}… beautiful… symbolic… uniquely yours.

Breathe in… and feel what it would be like if this quality were already alive in you… steady… natural… true.

Breathe out… and release any tension about when or how.

Thank the part of you that dared to dream. Carry this image as a reminder — not a demand.

When you are ready, gently return.`;
}

export { OUT_OF_SCOPE_REDIRECT };
