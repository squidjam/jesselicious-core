# JESSELICIOUS MOVE — Master Rebranding & Architecture Blueprint

> **Purpose of this Document:** This is an actionable, step-by-step engineering and design blueprint for forking `InlitX/GymMane` into **Jesselicious Move** (`jesselicious-move`), hosted under the master brand **Jesselicious** (`jesselicious.com`). Every instruction is written explicitly so an AI coding assistant or developer can execute it without ambiguity.

---

## 1. Project Identity, Licensing & Legal Compliance

### 1.1 Ecosystem & Repository Naming
* **Master Brand:** `Jesselicious` (`https://jesselicious.com`)
* **Core App Repository:** `jesselicious-move` (Fork of `https://github.com/InlitX/GymMane`)
* **Extension Packs Repository:** `jesselicious-packs` (Future repo for downloadable JSON + media bundles)
* **Brand & Web Repository:** `jesselicious-brand` (Logos, color tokens, landing page)
* **Reverse-DNS App / Package ID:** `com.jesselicious.move`
* **Display Name:** `Jesselicious Move` (Subtitle: *Adaptive Movement, Cycle-Aware & Habit Log*)

### 1.2 Mandatory Open-Source License Rules (`GPL-3.0-only` + Section 7(b))
1. **Keep `LICENSE` as `GPL-3.0-only`:** Any public release of `jesselicious-move` must keep the full source code publicly available under GPL-3.0.
2. **Mandatory UI Attribution (`ADDITIONAL_TERMS.md`):** You **MUST** display the exact string:
   ```text
   Based on GymMane by InlitX
   ```
   inside the app's interactive UI wherever legal/about notices appear (e.g., `Settings > About`). Do not delete or obscure this string.
3. **Art Credits (`CREDITS.md`):**
   * If you retain any original `assets/art/` path files from *Workout Guide* (Bryl Lim), *Everkinetic*, or *Open Exercise Art* (Alex Mollard), keep their `CC BY-SA 4.0` notices in `CREDITS.md`.
   * Any newly added artwork must be `CC0`, `MIT`, or `CC BY 4.0` compatible with GPL-3.0 redistribution.

---

## 2. Brand Identity & Design System (Direction C: Late 80s / Early 90s Retro-Pop)

### 2.1 Target Audience & Core Philosophy
* **Audience:** Women, queer folks, non-binary users, and anyone alienated by hyper-masculine, "hustle-culture" gym apps.
* **Core Promise:** Movement that adapts to *your* body, *your* energy/menstrual cycle, and *your* environment—100% offline, zero ads, zero guilt.
* **Tone of Voice:** Playful, campy, supportive, body-neutral, and zero-guilt.

### 2.2 Official Brand Color Tokens (Light & Dark Mode)

Implement these exact hex tokens in the Flutter `ThemeData` (`ColorScheme`):

| Token Role | Token Name | Hex Code | Usage Guidelines |
| :--- | :--- | :--- | :--- |
| **Primary Accent** | `Electric Magenta` | `#FF2E93` | Primary buttons, active tabs, completion badges, primary highlights. |
| **Secondary Accent** | `Radical Teal` | `#00C4B4` | Secondary buttons, progress bars, positive streaks, active toggles. |
| **Highlight / Warning** | `Acid Marigold` | `#FFD23F` | Smart-swap callouts, busy-gym alerts, XP/celebration badges. |
| **Cycle / Rest Accent** | `Retro Lavender` | `#9B5DE5` | Period-care mode, restorative mobility, yoga/Pilates tags. |
| **Light Background** | `Crisp Paper` | `#FFFDF7` | Primary canvas background in Light Mode. |
| **Dark Background** | `Dark Charcoal` | `#121218` | Primary canvas background in Dark Mode (elevated cards: `#1E1E28`). |
| **Ink / Border / Text** | `Ink Black` | `#141414` | All borders, hard drop-shadows, and Light Mode body text. |
| **Dark Mode Text** | `Glow Cream` | `#FFFDF7` | Primary text and vector illustration strokes in Dark Mode. |

### 2.3 Late-80s / Early-90s Neo-Brutalist UI Rules
* **Hard Borders:** Cards, buttons, and badges use solid `2px` borders (`#141414` in Light Mode; `#FFFDF7` or `#FF2E93` in Dark Mode).
* **Hard Offset Drop Shadows:** Instead of soft Material elevation blur, apply crisp offset shadows (`Offset(4, 4)`, `blurRadius: 0`) on primary cards and action buttons.
* **Typography Pairing:**
  * **Display / Headers:** Chunky, bubbly retro display font (e.g., Google Fonts `Shrikhand` or `Rubik Bubbles` for wordmark/celebrations, or `Space Grotesk` Bold for clean readable headers).
  * **Body & Numbers:** Clean geometric sans-serif (`Plus Jakarta Sans` or `Nunito` with `tabularFigures` enabled for reps/weights/timers).

### 2.4 UI Microcopy Replacement Dictionary
Search the codebase (and localization `.arb` / JSON files) to replace aggressive or sterile gym copy with inclusive Jesselicious copy:

| Original / Generic Copy | Jesselicious Replacement Copy |
| :--- | :--- |
| `Workout Complete` / `Crushed It!` | `You showed up!` / `Set Complete! +10 XP` |
| `Rest Day` / `Missed Workout` | `Recharge & Integrate` / `Rest is part of the rhythm.` |
| `Personal Record (PR)` | `New Milestone!` |
| `No exercises found` | `Nothing here yet—let's build your groove.` |
| `Replace Exercise` | `Smart Swap (Busy Gym / Home / Low Energy)` |

---

## 3. Open-Source Illustration & Asset Pipeline

### 3.1 How GymMane Renders Exercise Art
* GymMane does **not** use PNG/SVG files for built-in exercises.
* Instead, `assets/art/<name>` contains **3 lines of raw SVG `<path>` strings** (one line per animation frame, normalized to a `512x512` viewBox).
* Flutter's `path_drawing` package parses these lines at runtime and **automatically tints the strokes using the active theme color**.
  * *Implication:* Setting Dark Mode stroke color to `#FFFDF7` (Glow Cream) or `#00C4B4` (Radical Teal) automatically updates all built-in exercise animations without duplicating files.

### 3.2 Approved Open-Source Visual Libraries
1. **UI Mascots, Onboarding & Empty States (`CC0` — No Attribution Required):**
   * **Open Doodles** (`https://www.opendoodles.com/`): Recolor SVG fills to `#FF2E93`, `#00C4B4`, `#FFD23F`, and `#9B5DE5`.
   * **Open Peeps** (`https://www.openpeeps.com/`): Use for diverse, queer-inclusive user avatars, pack covers, and coach badges.
2. **Expanded Exercise Demonstrations:**
   * **Existing GymMane `assets/art/` (`CC BY-SA 4.0`):** Keep mechanical lifting diagrams where appropriate.
   * **RepDB Exercise Dataset** (`https://github.com/RepDB/exercise-dataset`): 701 exercises with JSON metadata + 512px flat illustrations (requires `"Exercise data by RepDB (repdb.co)"` in `CREDITS.md`).
   * **Custom SVG-to-Path Pipeline:** Any new `512x512` single-color SVG (for Pilates, yoga, or stretches) can be converted into a 1-to-3-line `<path>` file in `assets/art/` so it renders natively with theme tinting.

---

## 4. Step-by-Step Execution Plan for the Coding Agent

### Phase 1: Repository Initialization & App Identity
1. **Inspect Project Structure:**
   * Locate `pubspec.yaml`, `android/app/build.gradle` (or `build.gradle.kts`), `ios/Runner.xcodeproj`, and `lib/`.
2. **Update Package & App Metadata:**
   * In `pubspec.yaml`: Change `name: gymmane` to `name: jesselicious_move` and update `description`.
   * In Android (`AndroidManifest.xml` & `build.gradle`): Change `applicationId` / `namespace` to `com.jesselicious.move` and `android:label` to `Jesselicious Move`.
   * In iOS (`Info.plist`): Change `CFBundleDisplayName` to `Jesselicious Move` and `CFBundleIdentifier` to `com.jesselicious.move`.
   * Generate new app launcher icons (`flutter_launcher_icons`) using the Electric Magenta (`#FF2E93`) + Acid Marigold (`#FFD23F`) lightning/badge icon on Dark Charcoal (`#121218`).
3. **Update Legal & About Screens:**
   * Locate the About / Settings screen in `lib/`.
   * Ensure `"Based on GymMane by InlitX"` is prominently displayed.
   * Add a link to `https://jesselicious.com` and `CREDITS.md`.

### Phase 2: Implement the Retro-Pop Theme Engine (Light & Dark Mode)
1. **Locate Theme Definitions:** Find where `ThemeData` and `ColorScheme` are defined in `lib/`.
2. **Add Brand Color Constants:** Create `lib/theme/jesselicious_colors.dart` containing all hex codes from **Section 2.2**.
3. **Build Custom Neo-Brutalist Theme:**
   * Configure `ThemeData.light()` (Crisp Paper `#FFFDF7` background, Ink Black `#141414` borders) and `ThemeData.dark()` (Dark Charcoal `#121218` background, `#1E1E28` cards, Glow Cream `#FFFDF7` text).
   * Create a reusable `RetroCard` widget (`2px` solid border + `Offset(4, 4)` hard shadow) and apply it to workout cards, exercise tiles, and primary CTAs.
   * Add Google Fonts (`Shrikhand` or `Rubik Bubbles` for display titles; `Plus Jakarta Sans` for UI body).
4. **Verify `assets/art/` Tinting:** Confirm that the exercise animation painter reads `Theme.of(context).colorScheme.onSurface` (or primary accent) so animations pop clearly in Dark Mode.

### Phase 3: Expand the Exercise Database Schema for Modalities & Smart Swaps
Extend the existing Exercise model and local database (SQLite / Hive / JSON loader—inspect `lib/` to match the exact persistence layer used by GymMane) with backward-compatible optional fields:

```json
{
  "id": "glute_bridge_01",
  "name": "Glute Bridge",
  "art": "glute_bridge",
  "modality": "strength",
  "metric_type": "weight_reps",
  "movement_pattern": "hip_hinge",
  "environment": ["gym", "home"],
  "equipment": ["bodyweight", "mat"],
  "intensity": "low_impact",
  "cycle_friendly": ["menstrual", "luteal", "follicular", "ovulatory"],
  "pelvic_floor_safe": true,
  "swap_alternatives": ["hip_thrust_barbell", "supported_bridge_yoga"]
}
```

#### Field Specifications to Implement:
* `modality` *(enum)*: `strength` | `mobility` | `stretch` | `pilates` | `yoga` | `breathwork`
* `metric_type` *(enum)*:
  * `weight_reps` (standard lifting)
  * `reps_only` (bodyweight / Pilates)
  * `duration` (seconds/minutes timer for stretches, planks, yoga poses)
  * `distance_time` (cardio / rollerskating / walking)
* `movement_pattern` *(string)*: e.g., `hip_hinge`, `squat`, `horizontal_push`, `vertical_pull`, `spinal_flexion`, `thoracic_rotation`.
* `environment` *(list)*: `["gym", "home", "outdoor", "small_space"]`
* `cycle_friendly` *(list)*: Tags indicating suitability for `menstrual` (period care / low cramp strain), `follicular`, `ovulatory`, `luteal`.
* `intensity` *(enum)*: `restorative` | `low_impact` | `moderate` | `high_demand`

### Phase 4: Build the Context-Aware "Smart Swap" Engine
Create a service (`lib/services/smart_swap_service.dart`) that recommends instant replacements during an active workout or routine planner based on three one-tap triggers:
1. **"Machine / Equipment Taken" (Busy Gym Mode):**
   * Query exercises matching the same `movement_pattern` and primary muscle group, excluding the unavailable `equipment`.
2. **"Working Out at Home" (Home Mode):**
   * Filter strictly for `environment.contains("home")` and user's available home gear (e.g., `mat`, `dumbbells`, `bands`, `bodyweight`).
3. **"Period Care / Low Battery Mode":**
   * When toggled on, filter out `high_demand` / heavy intra-abdominal pressure lifts and prioritize `cycle_friendly.contains("menstrual")`, `restorative`, `mobility`, `stretch`, or gentle `pilates`/`yoga` equivalents for the same body region.

### Phase 5: Modular Extension Pack Loader (`jesselicious-packs` Ready)
1. **Define Pack Manifest Schema (`pack.json`):**
   Allow users to import `.zip` or `.json` packs from `jesselicious.com` (building on GymMane's existing backup/import pipeline):
   ```json
   {
     "pack_id": "pack_01_cycle_sync_mobility",
     "pack_version": "1.0.0",
     "title": "Pack 01: Cycle-Sync Mobility & Period Care",
     "author": "Jesselicious Studio",
     "license": "CC-BY-4.0",
     "cover_art": "cover.svg",
     "exercises": [ ... ]
   }
   ```
2. **Pack Manager UI:** Add a **"Packs & Extensions"** section in the app where users can view installed packs (styled as collectible 90s cassette/sticker badges) and import new packs offline from local files.

---

## 5. Verification Checklist Before Release
- [ ] App compiles cleanly on Android/iOS/Linux with `com.jesselicious.move` ID.
- [ ] `"Based on GymMane by InlitX"` is clearly visible on the About screen.
- [ ] Both **Light Mode (`#FFFDF7`)** and **Dark Mode (`#121218`)** pass WCAG contrast checks for text and `assets/art/` exercise paths.
- [ ] Duration-based exercises (Yoga/Pilates/Stretches) log smoothly without requiring weight/rep inputs.
- [ ] Toggling **Period Care Mode** or **Home Mode** suggests valid, biomechanically relevant swaps.
