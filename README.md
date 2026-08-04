# 🧘 Sanctum — AI-Powered Wellness Assistant for Snap Spectacles

Sanctum is an immersive AR wellness assistant built for **Snap Spectacles (2024)** using
**Lens Studio**, **TypeScript**, and the **OpenAI Remote Service Gateway**.

This repository represents a major evolution of the original Sanctum concept,
expanding it into a fully AI-driven experience with dynamic voice guidance,
real-time image generation, and intelligent session management.

🔗 Original Version (v1): https://github.com/urbanpeppermint/Sanctum

Sanctum delivers guided breathing exercises, acupressure stress-relief sessions,
chakra tuning with scoped awareness scripts, manifestation visualization with a
saved Vision Vault — all through voice, text, and AI-generated imagery in your
field of view.

---

## ✨ Features

### 1. Guided Breathing Practice 🌬️
- AI-generated ~1-minute guided breathing script (4-4-6 pattern: inhale, hold, exhale)
- Real-time text overlay counting each phase
- Calming TTS voice guidance (OpenAI `gpt-4o-mini-tts`, voice `coral`)
- AI-generated breathing posture diagram (DALL·E 3) — black background,
  white anatomical line art, numbered steps, blue/red arrows for inhale/exhale
- Image pre-loads before the session begins for a seamless experience

### 2. Acupressure Stress-Relief Session 💆
- Randomly selects 3 of 5 catalogued acupressure points per session
- AI-generated ~2-minute guided session script with per-point instructions
- Professional medical-style diagrams for each point:
  - Black background with white anatomical line art
  - Bright red dot marking the exact pressure point
  - Numbered step indicators (1, 2, 3) showing massage motion
  - No garbled text — prompts strictly avoid AI-generated fonts/words
- All 3 images pre-generated before the session starts (with spinner feedback)
- Voice guidance plays over the full session while images cycle every ~35 seconds

### 3. Chakra Awareness & Tuning 🎵
- 7 dedicated buttons, one per chakra (Root → Crown)
- Each button shows a **tuning scope card** (what this center addresses)
- AI-generated ~1-minute scoped script — body focus, color visualization, breath, affirmation
- Voice layers over chakra-tuned music (music triggered separately in scene)
- Never mentions frequency or Hz — refers only to "healing tones"

### 4. Manifestation Practice ✨
- Describe an intention (custom text in Inspector, or rotating suggestions)
- AI classifies chakra alignment and checks wellness scope boundaries
- DALL·E generates beautiful symbolic vision art (not medical diagrams)
- ~60s guided visualization voice script
- **Vision Vault** — save visions to device storage, browse later with Vault / Next / Prev

### 5. Intelligent Session Management 🔄
- Any button press instantly cancels the currently running session
- All buttons remain visible and interactive at all times
- sessionCancelled flag checked after every async call to prevent stale callbacks
- Clean fallback scripts for every session type if API calls fail

---

## 🏗️ Architecture

**SanctumController** (`Assets/Scripts/Sanctum/SanctumController.ts`) — modular replacement for `ExampleOAICalls`

```
SanctumController
├── Breathing      → preload image → script → voice → phase text
├── Acupressure    → preload 3 images → script → voice → point cycle
├── Chakra (×7)    → scope card → scoped script → voice
├── Manifestation  → classify intent → vision image → script → voice
└── VisionVault    → persistentStorage save/load/browse
```

Supporting modules:
- `SanctumData.ts` — catalogues, scope prompts, manifestation style
- `SanctumServices.ts` — OpenAI wrappers, VisionVault class
- `SanctumTypes.ts` — shared interfaces

Legacy: `BreathingPracticeAssistant` / `ExampleOAICalls` in RemoteServiceGatewayExamples package (still works; use SanctumController for new features)

Inputs:
- textDisplay, image, spinner
- breathingButton, acupressureButton, **manifestationButton**, **vaultButton**
- **saveVisionButton**, **vaultNextButton**, **vaultPrevButton** (optional)
- customManifestIntent (TextArea)
- 7× chakraButton

---

## 🔧 Tech Stack

- Platform: Snap Spectacles (2024) / Snap OS
- IDE: Lens Studio
- Language: TypeScript
- AI Chat: OpenAI gpt-4.1-nano via Remote Service Gateway
- AI Voice: OpenAI gpt-4o-mini-tts (voice: coral)
- AI Images: OpenAI DALL·E 3 (1024x1024, b64_json)
- Interaction: Spectacles Interaction Kit (Interactable)
- Gestures: GestureModule (pinch) + TapEvent (editor)

---

## 📦 Setup

### Prerequisites
- Latest Lens Studio with Spectacles support
- Spectacles Developer Program access
- Remote Service Gateway installed with OpenAI API key configured

### Installation
1. Clone or download the project into Lens Studio
2. Ensure these packages are installed:
   - SpectaclesInteractionKit.lspkg
   - RemoteServiceGatewayExamples.lspkg
3. Attach **SanctumController** (`Assets/Scripts/Sanctum/SanctumController.ts`) to your controller object
4. Wire inputs in Inspector (see `docs/SETUP-SANCTUM-CONTROLLER.md`):
   - Text → textDisplay
   - Image → image
   - SceneObject → spinner
   - Practice buttons → breathing, acupressure, manifestation, vault
   - 7 SceneObject buttons → chakra buttons
5. Push to Spectacles and test

**Full UX spec:** `docs/SANCTUM-UX-SPEC.md`  
**Wiring guide:** `docs/SETUP-SANCTUM-CONTROLLER.md`

---

## 🧠 Acupressure Points

- He Gu (LI4) — Web between thumb & index finger
- Nei Guan (PC6) — Inner wrist
- Yin Tang — Between eyebrows
- Jian Jing (GB21) — Top of shoulder
- Shen Men (HT7) — Wrist crease

---

## 🌈 Chakras

1. Root — Safety, grounding  
2. Sacral — Creativity, flow  
3. Solar Plexus — Confidence  
4. Heart — Love, compassion  
5. Throat — Expression  
6. Third Eye — Intuition  
7. Crown — Unity  

---

## ⚠️ Considerations

- DALL·E generation ~5–10 seconds per image
- Spectacles battery ~45 minutes
- First TTS playback may have small latency
- Chakra buttons trigger voice only (music handled separately)

---

## 📄 License

Apache‑2.0

---

## 🙏 Acknowledgments

- Snap Inc.
- Spectacles 
- OpenAI
- Spectacles Agent Skills by PtPavloTkachenko
