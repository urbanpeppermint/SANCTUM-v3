import { AcupressurePoint, BreathingPhase, ChakraData } from "./SanctumTypes";

export const BREATHING_PHASES: BreathingPhase[] = [
  { phase: "preparation", duration: 3, text: "Find a comfortable position. Let your body relax." },
  { phase: "inhale", duration: 4, text: "Breathe in slowly through your nose… 1… 2… 3… 4" },
  { phase: "hold", duration: 4, text: "Hold gently… 1… 2… 3… 4" },
  { phase: "exhale", duration: 6, text: "Breathe out slowly through your mouth… 1… 2… 3… 4… 5… 6" },
  { phase: "pause", duration: 2, text: "Notice the stillness…" },
];

export const BREATHING_TOTAL_CYCLES = 3;

export const BREATHING_IMAGE_PROMPTS: string[] = [
  "Professional minimalist medical illustration on solid black background. White clean line drawing of a person sitting cross-legged in calm meditation posture, front view, detailed anatomy. Lungs shown with subtle expanding motion lines inside the chest. A bright blue arrow flowing into the nose showing inhalation. A bright red arrow flowing out from the mouth showing exhalation. Three small white circles containing the numerals 1, 2, 3 placed at the nose, chest, and mouth marking the breathing sequence steps. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3 inside the circles.",
  "Professional minimalist medical illustration on solid black background. White clean line drawing of a person seated upright in a chair with hands resting on knees, side view, detailed anatomy. Diaphragm shown with subtle downward motion during breathing. A bright blue arrow entering the nose for inhalation. A bright red arrow leaving the mouth for exhalation. Three small white circles containing numerals 1, 2, 3 placed at nose for inhale, chest for hold, mouth for exhale. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3.",
];

export const ACUPRESSURE_POINTS: AcupressurePoint[] = [
  {
    name: "He Gu (LI4)",
    location: "In the web between your thumb and index finger",
    instruction:
      "Using the thumb and index finger of your opposite hand, firmly pinch the fleshy area between the thumb and index finger. Apply steady pressure in a circular motion for 30 seconds. Relieves stress, headaches, and tension.",
    imagePrompt:
      "Professional minimalist medical illustration on solid black background. White clean line drawing of a human hand, palm facing upward, detailed anatomy. A single bright glowing red circle marks the pressure point in the fleshy web between the thumb and index finger. Three small white circles containing the numerals 1, 2, 3 placed along thin white curved arrows showing a circular massage motion around the red point. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3 inside the circles.",
  },
  {
    name: "Nei Guan (PC6)",
    location: "Inner wrist, two finger-widths below the wrist crease",
    instruction:
      "Turn your palm up. Place three fingers across your wrist from the crease. The point is below your index finger between the two tendons. Press firmly with your thumb for 30 seconds while breathing deeply. Calms anxiety.",
    imagePrompt:
      "Professional minimalist medical illustration on solid black background. White clean line drawing of a human forearm and wrist, inner side facing up, detailed anatomy showing tendons. A single bright glowing red circle marks the pressure point on the inner wrist two finger-widths below the wrist crease between two tendons. A white arrow from three fingers placed across the wrist shows the measuring position. Three small white circles containing numerals 1, 2, 3 along thin white arrows showing pressing motion. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3.",
  },
  {
    name: "Yin Tang (Third Eye)",
    location: "Between the eyebrows, centre of the forehead",
    instruction:
      "Using your index finger, apply gentle but firm pressure directly between your eyebrows. Press in small circles for 30 seconds. Breathe slowly. Calms the mind and relieves anxiety.",
    imagePrompt:
      "Professional minimalist medical illustration on solid black background. White clean line drawing of a human face, front view, serene expression, detailed anatomy. A single bright glowing red circle marks the pressure point centered between the eyebrows on the forehead. A white drawn index finger approaches the point. Three small white circles containing numerals 1, 2, 3 along thin white curved arrows showing small circular pressing motion. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3.",
  },
  {
    name: "Jian Jing (GB21)",
    location: "Highest point of the shoulder muscle, midway between neck and shoulder edge",
    instruction:
      "Reach across with your opposite hand and find the midpoint of your shoulder muscle. Press down firmly with your fingers. Hold steady pressure for 30 seconds. Releases shoulder tension and stress.",
    imagePrompt:
      "Professional minimalist medical illustration on solid black background. White clean line drawing of a human upper body from behind, showing neck and both shoulders, detailed anatomy of trapezius muscle. A single bright glowing red circle marks the pressure point on top of the right shoulder muscle midway between neck and shoulder edge. A white drawn opposite hand reaches across to press the point. Three small white circles containing numerals 1, 2, 3 along thin white arrows showing downward pressing motion. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3.",
  },
  {
    name: "Shen Men (HT7)",
    location: "On the wrist crease, pinky side, in the small hollow",
    instruction:
      "Turn your palm up, find the wrist crease on the pinky side. Feel for a small dip next to the tendon. Apply gentle pressure with your opposite thumb for 30 seconds. The Spirit Gate, deeply calming for emotional stress.",
    imagePrompt:
      "Professional minimalist medical illustration on solid black background. White clean line drawing of a human hand and wrist, palm facing up, detailed anatomy showing wrist crease and tendons. A single bright glowing red circle marks the pressure point on the wrist crease on the pinky finger side in a small hollow beside the tendon. A white drawn opposite thumb presses the point. Three small white circles containing numerals 1, 2, 3 along thin white arrows showing gentle pressing motion. High contrast, clean precise anatomical line art, elegant, no words, no labels, no text except the numerals 1 2 3.",
  },
];

export const CHAKRAS: ChakraData[] = [
  {
    name: "Root",
    sanskritName: "Muladhara",
    color: "deep red",
    location: "the very base of your spine",
    element: "Earth",
    theme: "safety, grounding, and stability",
    frequencyLabel: "396 Hz",
    scopeBullets: ["Safety and belonging", "Physical stability", "Releasing fear", "Grounding into the present"],
    affirmation: "I am safe. I belong.",
    awareness:
      "Feel the weight of your body connecting to the ground beneath you. Visualize a warm, glowing sphere of deep red light at the base of your spine. With each breath, this light grows stronger, anchoring you firmly to the earth. You are safe. You are supported. You belong here.",
  },
  {
    name: "Sacral",
    sanskritName: "Svadhisthana",
    color: "warm orange",
    location: "just below your navel, in your lower abdomen",
    element: "Water",
    theme: "creativity, pleasure, and emotional flow",
    frequencyLabel: "417 Hz",
    scopeBullets: ["Creative flow", "Emotional permission", "Adaptability", "Pleasure without guilt"],
    affirmation: "I create freely. I feel fully.",
    awareness:
      "Bring your attention to the space just below your navel. Visualize a warm, glowing sphere of vibrant orange light gently swirling like water. Allow your emotions to flow freely without judgment. Feel your creative energy awakening. You are allowed to feel. You are allowed to create.",
  },
  {
    name: "Solar Plexus",
    sanskritName: "Manipura",
    color: "bright golden yellow",
    location: "your upper abdomen, around your stomach area",
    element: "Fire",
    theme: "confidence, personal power, and self-worth",
    frequencyLabel: "528 Hz",
    scopeBullets: ["Quiet confidence", "Healthy boundaries", "Self-worth", "Personal will"],
    affirmation: "I act with quiet strength.",
    awareness:
      "Focus on the area around your stomach. Visualize a radiant sphere of bright golden yellow light, warm like the sun. Feel its warmth spreading through your core, filling you with quiet confidence and inner strength. You are powerful. You are worthy. You trust yourself completely.",
  },
  {
    name: "Heart",
    sanskritName: "Anahata",
    color: "emerald green",
    location: "the center of your chest",
    element: "Air",
    theme: "love, compassion, and connection",
    frequencyLabel: "639 Hz",
    scopeBullets: ["Self-compassion", "Open-hearted connection", "Forgiveness", "Balanced giving and receiving"],
    affirmation: "My heart is open and steady.",
    awareness:
      "Bring your awareness to the center of your chest. Visualize a beautiful sphere of emerald green light expanding with each breath. Feel it radiating warmth and compassion, first toward yourself, then outward to everyone around you. You are loved. You are love itself. Your heart is open and free.",
  },
  {
    name: "Throat",
    sanskritName: "Vishuddha",
    color: "clear sky blue",
    location: "your throat",
    element: "Ether",
    theme: "truth, expression, and communication",
    frequencyLabel: "741 Hz",
    scopeBullets: ["Authentic expression", "Clear communication", "Listening with care", "Speaking your truth kindly"],
    affirmation: "My truth is worthy.",
    awareness:
      "Focus your attention on your throat. Visualize a clear, luminous sphere of sky blue light gently pulsing with each breath. Feel any tension in your jaw and neck softening. Your truth is worthy of expression. Your voice matters. Speak with kindness and clarity. You communicate with ease.",
  },
  {
    name: "Third Eye",
    sanskritName: "Ajna",
    color: "deep indigo",
    location: "the space between your eyebrows",
    element: "Light",
    theme: "intuition, insight, and inner wisdom",
    frequencyLabel: "852 Hz",
    scopeBullets: ["Inner clarity", "Trusting intuition", "Mental stillness", "Insight without forcing"],
    affirmation: "I see with wisdom.",
    awareness:
      "Bring your focus to the space between your eyebrows. Visualize a deep indigo sphere of light glowing softly. Feel your mind becoming still and clear like a calm lake. Trust the wisdom that arises from within. Your intuition is a guide. You see clearly. You trust your inner knowing.",
  },
  {
    name: "Crown",
    sanskritName: "Sahasrara",
    color: "luminous violet and white",
    location: "the very top of your head",
    element: "Cosmic energy",
    theme: "spiritual connection, unity, and transcendence",
    frequencyLabel: "963 Hz",
    scopeBullets: ["Spiritual connection", "Unity and peace", "Surrender", "Transcendence of separation"],
    affirmation: "I am connected. I am whole.",
    awareness:
      "Bring your awareness to the very top of your head. Visualize a radiant sphere of violet and pure white light opening like a thousand-petaled lotus. Feel yourself connected to something vast and infinite. You are part of everything. You are whole. You are at peace with all that is.",
  },
];

export const MANIFESTATION_DESIRES: string[] = [
  "Success in my endeavors",
  "Prosperity and abundance",
  "Inner peace and clarity",
  "Creative flow and inspiration",
  "An open, steady heart",
  "Courage to begin something new",
  "Deep restful sleep",
  "Joy in everyday moments",
  "Confidence in my voice",
  "Healing and renewal",
];

/** @deprecated Use MANIFESTATION_DESIRES */
export const MANIFESTATION_SUGGESTIONS: string[] = MANIFESTATION_DESIRES;

export const MANIFESTATION_IMAGE_STYLE =
  "Abstract symbolic wellness art for meditation visualization. NO human figures, NO silhouettes, NO seated meditation poses, NO chakras on a body, NO lotus figures. Use landscape, light, geometry, or nature metaphors that evoke the emotional quality of the intention. Distinct palette per theme. Cinematic depth, soft volumetric glow, painterly clarity, single strong focal symbol. No text, no words, no letters, no UI. 1024x1024.";

const INTENT_VISUAL_METAPHORS: Record<string, string> = {
  success: "a golden stairway of light ascending through morning mist toward a radiant summit",
  prosperity: "an open vessel filled with flowing amber light, surrounded by fertile green fields at dawn",
  peace: "a still lake reflecting soft teal aurora under a wide quiet sky",
  creative: "a spiral of prismatic color unfolding from a single seed of white light",
  heart: "two gentle arcs of rose-gold light meeting at center, petals of soft pink radiance",
  courage: "a narrow bridge of white fire crossing a deep canyon toward a bright doorway",
  sleep: "a deep indigo sky with a single soft moon over calm dark water",
  joy: "sunbeams breaking through clouds onto a meadow of wildflowers in warm gold",
  confidence: "a clear blue column of light rising from earth to sky like a steady pillar",
  healing: "a stream of emerald light washing over smooth river stones at twilight",
};

function metaphorForIntent(intent: string): string {
  const lower = intent.toLowerCase();
  for (const key in INTENT_VISUAL_METAPHORS) {
    if (lower.includes(key)) return INTENT_VISUAL_METAPHORS[key];
  }
  return (
    "a unique symbolic landscape of light and color embodying the felt sense of: " + intent +
    " — avoid any human form"
  );
}

export function buildManifestationImagePrompt(intent: string): string {
  return (
    MANIFESTATION_IMAGE_STYLE +
    " User intention: \"" + intent + "\". Visual metaphor: " + metaphorForIntent(intent) +
    ". Make this visually distinct from generic meditation app imagery."
  );
}

export const OUT_OF_SCOPE_REDIRECT =
  "Sanctum helps you visualize and embody your intention with calm — not predict the future. Let's refocus on how you want to feel as you move toward this.";

export function buildChakraScopePrompt(chakra: ChakraData): string {
  const scopeList = chakra.scopeBullets.map((b) => "- " + b).join("\n");
  return `You are Sanctum's energy guide. The user pressed the ${chakra.name} Chakra button.
Healing tones for this center are already playing.

TUNING SCOPE — stay strictly within:
- Location: ${chakra.location}
- Element: ${chakra.element}
- Themes: ${chakra.theme}
- Addresses:
${scopeList}
- Affirmation seed: "${chakra.affirmation}"
- Does NOT address: medical diagnosis, promises of external outcomes, financial or legal advice, or other chakras unless briefly closing

Use this awareness foundation and expand with your own wisdom:
${chakra.awareness}

Structure (~60 seconds spoken):
1. Invite attention to the location (10 seconds)
2. Color visualization at that point (15 seconds)
3. Breath cleansing into the center (20 seconds)
4. Theme affirmation (10 seconds)
5. Integration — carry awareness into daily life (5 seconds)

Rules:
- Never say Hz, frequency, hertz, or any numerical measurement
- Refer to the music as "healing tones" or "the sound flowing now"
- Speak slowly with natural pauses indicated by three dots
- Warm, nurturing, deeply calming tone`;
}

export function buildChakraScopeCard(chakra: ChakraData): string {
  return (
    chakra.name +
    " Chakra (" +
    chakra.sanskritName +
    ")\n" +
    "Tone: " +
    chakra.frequencyLabel +
    " · " +
    chakra.scopeBullets.join(" · ") +
    "\n\n" +
    "Location: " +
    chakra.location +
    "\n" +
    "Color: " +
    chakra.color +
    "\n" +
    "Theme: " +
    chakra.theme
  );
}

/** Short on-screen copy — matches spoken guidance. */
export function buildChakraDisplayText(chakra: ChakraData): string {
  return (
    chakra.name +
    " · " +
    chakra.frequencyLabel +
    "\n\n" +
    "Bring your attention to " +
    chakra.location +
    ".\n" +
    "Let the " +
    chakra.frequencyLabel +
    " tone wash through this center.\n\n" +
    chakra.affirmation
  );
}

/** ~45s spoken chakra tuning — body focus + frequency, no parallel AI session. */
export function buildChakraMeditationScript(chakra: ChakraData): string {
  return (
    "Settle into stillness... and gently bring your awareness to " +
    chakra.location +
    ".\n\n" +
    "The " +
    chakra.frequencyLabel +
    " healing tone is playing now... allow it to meet this energy center.\n\n" +
    "Notice the " +
    chakra.color +
    " light glowing softly here... with each breath, this light grows a little warmer... a little clearer.\n\n" +
    "Soften any tension in this part of your body... you do not need to force anything... simply listen... and feel.\n\n" +
    chakra.affirmation +
    "\n\n" +
    "Rest here for a few more breaths... carrying this balance with you."
  );
}
