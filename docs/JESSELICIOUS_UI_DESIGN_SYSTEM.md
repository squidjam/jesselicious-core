# JESSELICIOUS MOVE — UI/UX & Visual Design System Specification

> **Instructions for the AI Coding Agent:**  
> This document defines the complete visual, typographic, color, and component design system for **Jesselicious Move** (forked from `InlitX/GymMane`). Your task is to audit the existing Flutter UI codebase (`lib/`) and refactor its themes, widgets, cards, buttons, form fields, toggles, navigation, and vector rendering so every screen faithfully matches the **Late-80s / Early-90s Retro-Pop Neo-Brutalist** aesthetic shown in our Light Mode and Dark Mode brand guides.

---

## 1. Visual Philosophy & Aesthetic Rules

The visual language blends **late-1980s Memphis design** (playful squiggles, confetti dots, geometric accents, vibrant primaries) with **early-1990s neo-brutalist UI** (crisp borders, solid offset drop shadows, zero-blur surfaces, chunky display headers, and tactile sticker badges).

### Core Rules (Apply Globally)
1. **Zero Soft Elevation Blur:** Never use Material default `elevation` blur shadows (`BoxShadow` with `blurRadius > 0`). All depth is created using **hard offset drop shadows** (`blurRadius: 0`, `spreadRadius: 0`, `offset: Offset(4, 4)` on cards and `Offset(3, 3)` on buttons).
2. **Crisp Outlines Everywhere:** Every interactive or grouped surface (cards, buttons, text inputs, chips, bottom sheets, dialogs) must have a solid `2.0px` border.
3. **Playful Tactility:** Buttons physically depress into their shadow on press (`translate(2, 2)` while shrinking shadow offset to `Offset(1, 1)`).
4. **High-Contrast Legibility:** Never place low-contrast pastel text on bright backgrounds. Follow the exact foreground/background pairings in Section 2.

---

## 2. Color System & Theme Tokens

Create `lib/theme/jesselicious_colors.dart` and configure both `ThemeData.light()` and `ThemeData.dark()` in the app's theme provider.

### 2.1 Brand Palette Constants

| Token Name | Hex Code | Flutter `Color` | Semantic Role |
| :--- | :--- | :--- | :--- |
| `electricMagenta` | `#FF2E93` | `Color(0xFFFF2E93)` | Primary brand accent, active CTAs, celebratory headers, active tabs |
| `radicalTeal` | `#00C4B4` | `Color(0xFF00C4B4)` | Secondary accent, progress indicators, active toggles, secondary buttons |
| `acidMarigold` | `#FFD23F` | `Color(0xFFFFD23F)` | Highlights, XP/milestone badges, busy-gym/home smart-swap callouts |
| `retroLavender` | `#9B5DE5` | `Color(0xFF9B5DE5)` | Period-care mode, restorative mobility, yoga/Pilates tags |
| `crispPaper` | `#FFFDF7` | `Color(0xFFFFFDF7)` | Light Mode scaffold background & card surface |
| `inkBlack` | `#141414` | `Color(0xFF141414)` | Light Mode text, borders, hard shadows, and button outlines |
| `darkCharcoal` | `#121218` | `Color(0xFF121218)` | Dark Mode scaffold background |
| `darkSurface` | `#1E1E28` | `Color(0xFF1E1E28)` | Dark Mode elevated card & input fill surface |
| `glowCream` | `#FFFDF7` | `Color(0xFFFFFDF7)` | Dark Mode primary text, vector exercise strokes, and high-contrast borders |

### 2.2 Mode-Specific Surface & Border Mapping

| UI Element | Light Mode (`ThemeMode.light`) | Dark Mode (`ThemeMode.dark`) |
| :--- | :--- | :--- |
| **Scaffold Background** | `#FFFDF7` (`crispPaper`) | `#121218` (`darkCharcoal`) |
| **Standard Card Fill** | `#FFFDF7` (`crispPaper`) | `#1E1E28` (`darkSurface`) |
| **Standard Card Border** | `2px solid #141414` | `2px solid #FFFDF7` (or `#00C4B4` for active workout cards) |
| **Standard Card Shadow** | `Offset(4, 4)` solid `#141414` | `Offset(4, 4)` solid `#FF2E93` or `#00C4B4` (neon hard shadow) |
| **Primary Text** | `#141414` (`inkBlack`) | `#FFFDF7` (`glowCream`) |
| **Secondary / Muted Text** | `#4A4A58` | `#B8B8C8` |
| **Primary CTA Fill** | `#FF2E93` (`electricMagenta`) | `#FF2E93` (`electricMagenta`) |
| **Primary CTA Text** | `#FFFDF7` (`glowCream`) | `#FFFDF7` (`glowCream`) |
| **Secondary / Swap Banner Fill** | `#FFD23F` (`acidMarigold`) with `#141414` text | `#9B5DE5` (`retroLavender`) with `#FFFDF7` text |
| **Exercise Vector Art (`assets/art/`)** | `#141414` (`inkBlack`) strokes | `#FFFDF7` (`glowCream`) or `#00C4B4` (`radicalTeal`) strokes |

---

## 3. Typography System

Configure `TextTheme` (using `google_fonts` or bundled `.ttf` fonts in `assets/fonts/`):

1. **Display & Brand Headers (`displayLarge`, `displayMedium`, `headlineMedium`):**
   * **Font Family:** `Rubik Bubbles` or `Shrikhand` (bubbly 90s retro display style matching the *Jesselicious* wordmark).
   * **Usage:** App title, screen headers, modal titles, and celebration banners (*"Set Complete! +10 XP"*, *"You showed up!"*).
   * **Dark Mode Enhancement:** For hero display titles in Dark Mode, apply a subtle layered text shadow (`Shadow(offset: Offset(2, 2), color: Color(0xFF141414))` or soft magenta glow) so bubbly headers pop off `#121218`.
2. **Section Titles & Card Headers (`titleLarge`, `titleMedium`):**
   * **Font Family:** `Space Grotesk` (Bold / `FontWeight.w700`).
   * **Usage:** Exercise names, routine titles, pack headers, and button labels.
3. **Body Copy & Descriptions (`bodyLarge`, `bodyMedium`):**
   * **Font Family:** `Plus Jakarta Sans` or `Nunito` (`FontWeight.w500` / `w600`).
   * **Usage:** Exercise instructions, empty-state copy, settings descriptions.
4. **Numeric Counters & Timers (Reps, Weights, Rest Timer):**
   * Apply `fontFeatures: [FontFeature.tabularFigures()]` in `Space Grotesk` Bold so numbers never jitter horizontally while counting down or logging sets.

---

## 4. Component Specifications (Build Reusable Primitives)

Create a dedicated directory `lib/widgets/retro/` containing standardized UI primitives, then replace raw Material `Card`, `ElevatedButton`, `TextField`, and `Switch` widgets across the app.

### 4.1 `RetroCard` (`lib/widgets/retro/retro_card.dart`)
* **Shape:** `BorderRadius.circular(14)`
* **Border:** `Border.all(color: borderColor, width: 2.0)`
* **Shadow:** `BoxShadow(color: shadowColor, offset: Offset(4, 4), blurRadius: 0)`
* **Padding:** `EdgeInsets.all(16)` default
* **Variants:**
  * `RetroCard.standard` — Neutral card background (`#FFFDF7` light / `#1E1E28` dark).
  * `RetroCard.celebration` — `#FF2E93` fill with `#00C4B4` border/shadow (used for *"Set Complete! +10 XP"* toast/banner).
  * `RetroCard.periodCare` — `#9B5DE5` (Retro Lavender) accent border + badge (used for low-energy/menstrual swap suggestions).
  * `RetroCard.smartSwap` — `#FFD23F` (Acid Marigold) fill with `#141414` text & border (used for busy-gym/home replacement prompts).

### 4.2 `RetroButton` (`lib/widgets/retro/retro_button.dart`)
* **Height:** Minimum `48px` (accessible touch target).
* **Shape:** `BorderRadius.circular(12)` with `2.0px` solid border (`#141414` in Light Mode; `#FFFDF7` in Dark Mode).
* **Resting Shadow:** `BoxShadow(color: shadowColor, offset: Offset(3, 3), blurRadius: 0)`.
* **Pressed State (`GestureDetector` / `AnimatedContainer`, `80ms` duration):**
  * Shifts widget by `Matrix4.translationValues(2, 2, 0)` and reduces shadow offset to `Offset(1, 1)` to mimic a tactile arcade/90s button click.
* **Color Variants:**
  * `primary`: `#FF2E93` (Electric Magenta) fill, `#FFFDF7` bold label.
  * `secondary`: `#00C4B4` (Radical Teal) fill, `#141414` bold label.
  * `highlight`: `#FFD23F` (Acid Marigold) fill, `#141414` bold label.
  * `ghost`: Transparent fill, `2px` border, theme `onSurface` label.

### 4.3 Form Fields & Numeric Set Loggers (`RetroTextField` & `RetroStepper`)
Workout apps rely heavily on quick set/rep/weight entry. Replace standard Material underline/outline inputs with:
* **Text & Search Fields (`RetroTextField`):**
  * `BorderRadius.circular(12)`
  * Fill color: `#FFFFFF` (Light Mode) / `#1E1E28` (Dark Mode)
  * Default border: `2.0px solid #141414` (Light) / `2.0px solid #FFFDF7` (Dark)
  * Focused border: `2.5px solid #FF2E93` (Electric Magenta) with a `3px` hard shadow in `#00C4B4` (Radical Teal).
  * Label style: Uppercase or bold `Space Grotesk`, `13px`, clearly positioned above or inside with high contrast.
* **Set / Rep / Weight Quick-Steppers (`RetroStepper`):**
  * Pair numeric input boxes with chunky square `-` and `+` buttons (`36x36px`, `2px` border, `#FFD23F` or `#00C4B4` fill) so users can tap with sweaty hands without opening the keyboard.

### 4.4 Toggles, Chips & Badges
* **Period Care / Low-Energy Toggle (`RetroSwitch`):**
  * Pill-shaped track (`52x30px`, `2px` solid border).
  * Off state: Neutral track (`#E2E2EC` light / `#2A2A38` dark) with circular thumb.
  * On state: `#FFD23F` (Acid Marigold) or `#9B5DE5` (Retro Lavender) track with crisp `#FFFDF7` thumb and `#141414` `2px` outline.
* **Modality & Equipment Filter Chips (`RetroChip`):**
  * Pill shape (`BorderRadius.circular(20)`), `1.5px` solid border.
  * Selected state: Filled with `#00C4B4` (strength/cardio) or `#9B5DE5` (yoga/Pilates/mobility) with `Offset(2, 2)` hard shadow.
* **Extension Pack & Milestone Badges (`RetroStickerBadge`):**
  * Circular or scalloped starburst container (`2px` `#141414` outline) inspired by 90s enamel pins and stickers, used on the **Packs & Extensions** screen and workout completion modals.

### 4.5 Memphis Decorative Background Accents (`MemphisPatternPainter`)
* Create a lightweight `CustomPainter` (`lib/widgets/retro/memphis_pattern_painter.dart`) that draws sparse, non-distracting 80s/90s geometric confetti (tiny triangles, squiggles, dots, and sparkles in `#FF2E93`, `#00C4B4`, `#FFD23F`, and `#9B5DE5` at `15%–25%` opacity).
* **Where to use:** Only on celebratory headers, empty states, onboarding screens, and the About/Brand banner—**never** behind dense workout tables or text forms where visual noise could hurt readability.

---

## 5. Step-by-Step Implementation Checklist for the Coding Agent

1. **Audit Existing UI Files:**
   * Inspect `lib/main.dart` and all files inside `lib/` that configure `ThemeData`, `ColorScheme`, `Card`, `ElevatedButton`, `OutlinedButton`, `TextField`, `InputDecorationTheme`, and `NavigationBar` / `BottomNavigationBar`.
2. **Add Dependencies (`pubspec.yaml`):**
   * Ensure `google_fonts` (or local font files in `assets/fonts/`) is available for `Rubik Bubbles`, `Space Grotesk`, and `Plus Jakarta Sans`.
3. **Create Theme & Primitive Layer:**
   * Create `lib/theme/jesselicious_colors.dart` and `lib/theme/jesselicious_theme.dart`.
   * Create `lib/widgets/retro/retro_card.dart`, `retro_button.dart`, `retro_text_field.dart`, `retro_chip.dart`, and `memphis_pattern_painter.dart`.
4. **Refactor Navigation & App Bar:**
   * Style `AppBar` with flat background (`crispPaper` / `darkCharcoal`), a `2px` bottom border, and the **Jesselicious Move** display title.
   * Style bottom navigation bar with a `2px` top border and a pill-shaped active indicator in `#FF2E93` (Light) or `#00C4B4` (Dark) with a `2px` solid outline.
5. **Refactor Core Workout & Exercise Screens:**
   * Replace exercise list tiles and active workout set cards with `RetroCard`.
   * Replace set completion buttons and *"Add Exercise"* buttons with `RetroButton`.
   * Update the `assets/art/` vector painter so stroke colors dynamically resolve to `#141414` in Light Mode and `#FFFDF7` / `#00C4B4` in Dark Mode.
6. **Add Period Care & Smart Swap UI Controls:**
   * Add a prominent **Period Care / Low-Energy Mode** `RetroSwitch` banner at the top of the active workout/routine screen.
   * Add a one-tap **Smart Swap** button (`RetroButton.highlight`) on each exercise card to trigger Busy Gym, Home, or Low-Energy alternatives.
7. **Verify Visual & Accessibility Quality:**
   * Test every screen in both **Light Mode** and **Dark Mode**.
   * Verify there are zero text overflows with bubbly display headers on small mobile viewports (`360px` width).
   * Confirm all interactive controls maintain >= `4.5:1` text contrast.
