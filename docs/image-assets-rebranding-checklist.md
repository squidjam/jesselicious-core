# Image Assets Rebranding Checklist

This document lists all image assets that need to be remade or replaced for the Jesselicious rebranding. They are organized by **priority** — start with 🔴 Critical and work down.

---

## 🔴 Critical — App Icons (What Users See)

These are the launcher icons displayed on home screens, app stores, and device settings. They are the most visible branded assets.

### 1. Android Default Launcher Icon

Replace these 5 files with new Jesselicious branding:

| File | Size | DPI |
|------|------|-----|
| `android/app/src/main/res/mipmap-mdpi/ic_launcher.png` | 48×48 | mdpi |
| `android/app/src/main/res/mipmap-hdpi/ic_launcher.png` | 72×72 | hdpi |
| `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png` | 96×96 | xhdpi |
| `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png` | 144×144 | xxhdpi |
| `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png` | 192×192 | xxxhdpi |

**Also replace the foreground layer** (used in adaptive icons):

| File | Size | DPI |
|------|------|-----|
| `android/app/src/main/res/drawable-mdpi/ic_launcher_foreground.png` | 108×108 | mdpi |
| `android/app/src/main/res/drawable-hdpi/ic_launcher_foreground.png` | 162×162 | hdpi |
| `android/app/src/main/res/drawable-xhdpi/ic_launcher_foreground.png` | 216×216 | xhdpi |
| `android/app/src/main/res/drawable-xxhdpi/ic_launcher_foreground.png` | 324×324 | xxhdpi |
| `android/app/src/main/res/drawable-xxxhdpi/ic_launcher_foreground.png` | 432×432 | xxxhdpi |

### 2. Android Theme Variant Icons (Adaptive Icon Layers)

10 theme variants, each a single 1024×1024 `.webp` file:

| File | Theme |
|------|-------|
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_glass.webp` | Glass |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_graphite.webp` | Graphite |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_light.webp` | Light |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_marble.webp` | Marble |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_material.webp` | Material |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_medal.webp` | Medal |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_night.webp` | Night |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_sage.webp` | Sage |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_sand.webp` | Sand |
| `android/app/src/main/res/mipmap-nodpi/ic_launcher_stopwatch.webp` | Stopwatch |

**Note:** The theme names (glass, graphite, etc.) are not brand names — they stay the same. Only the icon imagery needs rebranding.

### 3. iOS Main App Icon

22 size variants in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`:

| File | Size (points) | Scale |
|------|---------------|-------|
| `Icon-App-20x20@1x.png` | 20×20 | 1× (40×40 px) |
| `Icon-App-20x20@2x.png` | 20×20 | 2× (40×40 px) |
| `Icon-App-20x20@3x.png` | 20×20 | 3× (60×60 px) |
| `Icon-App-29x29@1x.png` | 29×29 | 1× (29×29 px) |
| `Icon-App-29x29@2x.png` | 29×29 | 2× (58×58 px) |
| `Icon-App-29x29@3x.png` | 29×29 | 3× (87×87 px) |
| `Icon-App-40x40@1x.png` | 40×40 | 1× (40×40 px) |
| `Icon-App-40x40@2x.png` | 40×40 | 2× (80×80 px) |
| `Icon-App-40x40@3x.png` | 40×40 | 3× (120×120 px) |
| `Icon-App-50x50@1x.png` | 50×50 | 1× (50×50 px) |
| `Icon-App-50x50@2x.png` | 50×50 | 2× (100×100 px) |
| `Icon-App-57x57@1x.png` | 57×57 | 1× (57×57 px) |
| `Icon-App-57x57@2x.png` | 57×57 | 2× (114×114 px) |
| `Icon-App-60x60@2x.png` | 60×60 | 2× (120×120 px) |
| `Icon-App-60x60@3x.png` | 60×60 | 3× (180×180 px) |
| `Icon-App-72x72@1x.png` | 72×72 | 1× (72×72 px) |
| `Icon-App-72x72@2x.png` | 72×72 | 2× (144×144 px) |
| `Icon-App-76x76@1x.png` | 76×76 | 1× (76×76 px) |
| `Icon-App-76x76@2x.png` | 76×76 | 2× (152×152 px) |
| `Icon-App-83.5x83.5@2x.png` | 83.5×83.5 | 2× (167×167 px) |
| `Icon-App-1024x1024@1x.png` | 1024×1024 | 1× (App Store) |

### 4. iOS Theme Variant Icons

10 theme variants, each a single `icon.png` file:

| File | Theme |
|------|-------|
| `ios/Runner/Assets.xcassets/AppIcon-glass.appiconset/icon.png` | Glass |
| `ios/Runner/Assets.xcassets/AppIcon-graphite.appiconset/icon.png` | Graphite |
| `ios/Runner/Assets.xcassets/AppIcon-light.appiconset/icon.png` | Light |
| `ios/Runner/Assets.xcassets/AppIcon-marble.appiconset/icon.png` | Marble |
| `ios/Runner/Assets.xcassets/AppIcon-material.appiconset/icon.png` | Material |
| `ios/Runner/Assets.xcassets/AppIcon-medal.appiconset/icon.png` | Medal |
| `ios/Runner/Assets.xcassets/AppIcon-night.appiconset/icon.png` | Night |
| `ios/Runner/Assets.xcassets/AppIcon-sage.appiconset/icon.png` | Sage |
| `ios/Runner/Assets.xcassets/AppIcon-sand.appiconset/icon.png` | Sand |
| `ios/Runner/Assets.xcassets/AppIcon-stopwatch.appiconset/icon.png` | Stopwatch |

### 5. Web Icons (PWA)

| File | Size | Purpose |
|------|------|---------|
| `web/icons/Icon-192.png` | 192×192 | PWA install icon |
| `web/icons/Icon-512.png` | 512×512 | PWA splash screen |
| `web/icons/Icon-maskable-192.png` | 192×192 | Maskable PWA icon |
| `web/icons/Icon-maskable-512.png` | 512×512 | Maskable PWA icon |
| `web/icons/apple-touch-icon.png` | 180×180 | iOS home screen |
| `web/favicon.png` | 16×16 | Browser tab icon |

### 6. Android Notification Icon

⚠️ **Old files still exist and should be deleted** after replacement:

| File (keep, already renamed) | File (delete after) |
|-------------------------------|---------------------|
| `android/app/src/main/res/drawable-hdpi/ic_stat_jesselicious.png` | `android/app/src/main/res/drawable-hdpi/ic_stat_gymmane.png` |
| `android/app/src/main/res/drawable-xhdpi/ic_stat_jesselicious.png` | `android/app/src/main/res/drawable-xhdpi/ic_stat_gymmane.png` |
| `android/app/src/main/res/drawable-xxhdpi/ic_stat_jesselicious.png` | `android/app/src/main/res/drawable-xxhdpi/ic_stat_gymmane.png` |
| `android/app/src/main/res/drawable-xxxhdpi/ic_stat_jesselicious.png` | `android/app/src/main/res/drawable-xxxhdpi/ic_stat_gymmane.png` |
| `android/app/src/main/res/drawable-mdpi/ic_stat_jesselicious.png` | `android/app/src/main/res/drawable-mdpi/ic_stat_gymmane.png` |

The `ic_stat_jesselicious.png` files are the correct ones. Remake them with new branding, then delete the `ic_stat_gymmane.png` counterparts.

---

## 🟡 Important — In-App & Store Images

### 7. In-App Icon Preview

| File | Purpose |
|------|---------|
| `assets/img/app_icon.png` | Shown in the in-app theme picker |
| `assets/icon/ic_1024.png` | Source 1024×1024 app icon |
| `assets/icon/ic_fg_1024.png` | Source foreground layer |

### 8. In-App Theme Variant Previews

10 files shown in the theme picker inside the app:

| File | Theme |
|------|-------|
| `assets/icon/variants/default.webp` | Default |
| `assets/icon/variants/glass.webp` | Glass |
| `assets/icon/variants/graphite.webp` | Graphite |
| `assets/icon/variants/light.webp` | Light |
| `assets/icon/variants/marble.webp` | Marble |
| `assets/icon/variants/material.webp` | Material |
| `assets/icon/variants/medal.webp` | Medal |
| `assets/icon/variants/night.webp` | Night |
| `assets/icon/variants/sage.webp` | Sage |
| `assets/icon/variants/sand.webp` | Sand |
| `assets/icon/variants/stopwatch.webp` | Stopwatch |

### 9. Android Adaptive Icon Drawable Layers

10 additional drawable files for adaptive icons:

| File | Theme |
|------|-------|
| `android/app/src/main/res/drawable-nodpi/icon_glass.webp` | Glass |
| `android/app/src/main/res/drawable-nodpi/icon_graphite.webp` | Graphite |
| `android/app/src/main/res/drawable-nodpi/icon_light.webp` | Light |
| `android/app/src/main/res/drawable-nodpi/icon_marble.webp` | Marble |
| `android/app/src/main/res/drawable-nodpi/icon_material.webp` | Material |
| `android/app/src/main/res/drawable-nodpi/icon_medal.webp` | Medal |
| `android/app/src/main/res/drawable-nodpi/icon_night.webp` | Night |
| `android/app/src/main/res/drawable-nodpi/icon_sage.webp` | Sage |
| `android/app/src/main/res/drawable-nodpi/icon_sand.webp` | Sand |
| `android/app/src/main/res/drawable-nodpi/icon_stopwatch.webp` | Stopwatch |

### 10. App Store Metadata

| File | Purpose |
|------|---------|
| `fastlane/metadata/android/en-US/images/icon.png` | Play Store icon (512×512) |
| `fastlane/metadata/android/en-US/images/featureGraphic.png` | Play Store feature graphic (1024×500) |
| `fastlane/metadata/android/en-US/images/phoneScreenshots/1.png` – `7.png` | Play Store screenshots (7 images) |
| `fastlane/metadata/android/es-ES/images/phoneScreenshots/1.png` – `7.png` | Play Store screenshots Spanish (7 images) |

The feature graphic and screenshots will need to be retaken or edited once the app is rebranded.

### 11. Documentation Screenshots

All screenshots in `docs/screenshots/` show the old GymMane UI and will need to be retaken:

| File | Screen |
|------|--------|
| `docs/screenshots/01-home.png` | Home screen |
| `docs/screenshots/02-progress.png` | Progress screen |
| `docs/screenshots/03-train.png` | Train screen |
| `docs/screenshots/04-session.png` | Session screen |
| `docs/screenshots/05-history.png` | History screen |
| `docs/screenshots/06-library.png` | Library screen |
| `docs/screenshots/07-routines.png` | Routines screen |
| `docs/screenshots/08-settings.png` | Settings screen |
| `docs/screenshots/09-notes.png` | Notes screen |
| `docs/screenshots/10-places.png` | Places screen |
| `docs/screenshots/11-body.png` | Body screen |
| `docs/screenshots/12-profile.png` | Profile screen |
| `docs/screenshots/13-nutrition.png` | Nutrition screen |
| `docs/screenshots/14-nutrition-day.png` | Nutrition day screen |
| `docs/screenshots/banner-en.png` | English banner |
| `docs/screenshots/banner-es.png` | Spanish banner |
| `docs/screenshots/icon.png` | Documentation icon |
| `docs/screenshots/devices.png` | Device mockups |
| `docs/screenshots/desk-home.png` | Desktop home |
| `docs/screenshots/desk-progress.png` | Desktop progress |
| `docs/screenshots/watch-home.png` | Watch home |
| `docs/screenshots/watch-rest.png` | Watch rest timer |

Plus 12 mock versions in `docs/screenshots/mock/` (same screens as above).

---

## 🟢 Check — Widget & Live Activity Images

### 12. Android Widget Previews

8 preview screenshots shown in the Android widget picker. Check if they display the app name visually:

| File | Widget |
|------|--------|
| `android/app/src/main/res/drawable/preview_body.png` | Body composition widget |
| `android/app/src/main/res/drawable/preview_heatmap.png` | Heatmap widget |
| `android/app/src/main/res/drawable/preview_kcal.png` | Calories widget |
| `android/app/src/main/res/drawable/preview_muscles.png` | Muscle groups widget |
| `android/app/src/main/res/drawable/preview_protein.png` | Protein widget |
| `android/app/src/main/res/drawable/preview_stats.png` | Stats widget |
| `android/app/src/main/res/drawable/preview_today.png` | Today's workout widget |
| `android/app/src/main/res/drawable/preview_water.png` | Water intake widget |
| `android/app/src/main/res/drawable/preview_week.png` | Weekly summary widget |

These are screenshots of the widget UI. If they show "GymMane" in the widget title, they need to be retaken after rebranding.

### 13. iOS Widget Live Activity Icon

| File | Purpose |
|------|---------|
| `../ios/JesseliciousWidgets` | Live Activity icon 2× |
| `../ios/JesseliciousWidgets` | Live Activity icon 3× |

---

## ⚪ Skip — Functional Images (No Rebranding Needed)

These images are functional illustrations and do not contain any branding:

- **`assets/badges/`** — ~40 achievement badge icons (firstWorkout, streak30, hours100, etc.) — generic fitness symbols
- **`assets/food/`** — Large collection of food item images — no branding
- **`assets/img/banner_default.jpg`** — Default banner placeholder
- **`assets/img/profile_default.jpg`** — Default profile picture placeholder
- **`assets/img/runner.png`** — Runner illustration
- **`assets/img/support-cat.png`** — Support/help cat illustration
- **`assets/img/peek-*.webp`** — Supplement peek illustrations (can, choco, pan, protein, shake, water, yogurt)
- **`assets/img/recovery-*.webp`** — Recovery method illustrations (cold, contrast, heat, lungs, sauna, towel)
- **`assets/img/shake-*.webp`** — Shake texture and vessel images
- **`assets/img/supp-*.webp`** — Supplement illustrations
- **`assets/img/vessel-*.webp`** — Water/shake vessel illustrations

---

## Summary Count

| Category | Files to Remake | Priority |
|----------|-----------------|----------|
| Android launcher icons (default + foreground) | 10 | 🔴 Critical |
| Android theme variants (mipmap + drawable) | 20 | 🔴 Critical |
| iOS main app icon (all sizes) | 21 | 🔴 Critical |
| iOS theme variants | 10 | 🔴 Critical |
| Web PWA icons | 6 | 🔴 Critical |
| Android notification icons | 5 | 🔴 Critical |
| In-app icon previews | 14 | 🟡 Important |
| App Store metadata | 19 | 🟡 Important |
| Documentation screenshots | 33 | 🟡 Important |
| Android widget previews | 9 | 🟢 Check |
| iOS Live Activity icons | 2 | 🟢 Check |
| **Total** | **~149 files** | |

---

## Recommended Workflow

1. **Design a master 1024×1024 icon** for Jesselicious
2. **Generate all size variants** using a tool like `flutter_launcher_icons` or an icon generator
3. **Create the 10 theme variants** by applying each theme's color treatment to the master design
4. **Update notification icons** as simple monochrome versions
5. **Retake screenshots** once the app runs with new branding
6. **Delete old `ic_stat_gymmane.png` files** after replacing with `ic_stat_jesselicious.png`

### Using `flutter_launcher_icons`

The simplest way to regenerate all platform icons from a single source image:

```yaml
# Add to pubspec.yaml dev_dependencies
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  web: true
  image_path: "assets/icon/ic_1024.png"  # Your new master icon
```

Then run:
```bash
flutter pub get
flutter pub run flutter_launcher_icons
```

This will regenerate items 1–6 automatically. You'll still need to manually create the theme variants (items 2, 4, 8, 9).
