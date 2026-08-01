export type ChakraName =
  | "Root"
  | "Sacral"
  | "Solar Plexus"
  | "Heart"
  | "Throat"
  | "Third Eye"
  | "Crown";

export type PracticeMode = "idle" | "breathing" | "acupressure" | "manifestation" | "chakra";

export type HubView =
  | "main"
  | "breathing"
  | "acupressure"
  | "chakra"
  | "manifestation"
  | "manifestList"
  | "manifestVoice";

export interface AcupressurePoint {
  name: string;
  location: string;
  instruction: string;
  imagePrompt: string;
}

export interface ChakraData {
  name: ChakraName;
  sanskritName: string;
  color: string;
  location: string;
  element: string;
  theme: string;
  frequencyLabel: string;
  awareness: string;
  scopeBullets: string[];
  affirmation: string;
}

export interface BreathingPhase {
  phase: string;
  duration: number;
  text: string;
}

export interface VisionEntry {
  id: string;
  createdAt: number;
  intentText: string;
  scriptSummary: string;
  imageB64: string;
  chakraTag?: ChakraName;
}

export interface SanctumUICallbacks {
  onNavigate: (view: HubView) => void;
  onBackToMain: () => void;
  onStartBreathing: () => void;
  onStartAcupressure: () => void;
  onStartChakra: (index: number) => void;
  onOpenManifestList: () => void;
  onOpenManifestVoice: () => void;
  onDesirePrev: () => void;
  onDesireNext: () => void;
  onDesireSelect: () => void;
  onBeginManifestation: () => void;
  onStartVoiceCapture: () => void;
  onTypeIntent: () => void;
  onSaveVision: () => void;
  onVault: () => void;
  onVaultPrev: () => void;
  onVaultNext: () => void;
}
