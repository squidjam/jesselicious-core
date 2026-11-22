---
sessionId: session-261122-124308-v70j
---

# Requirements

### Overview & Goals

Fork GymMane into Jesselicious — a new app with a new package ID, complete rebranding, and a data importer for migrating from the old GymMane app. The new app will be offline-first with an optional cloud server for trainer marketplace, AI coaching, and social features.

### Scope

**In Scope:**
- Change package ID from `com.gymmane.app` to `com.jesselicious.app` (core app)
- Module apps will use their own namespaces: `com.jesselicious.move`, `com.jesselicious.yoga`, `com.jesselicious.dance`
- Complete rebranding of all visible text and assets
- Build GymMane data importer for migrating user data
- Outline new server architecture (PHP/MariaDB) for future implementation
- Preserve attribution to GymMane by InlitX

**Out of Scope:**
- Implementing the new server (outlined only, to be implemented in a future phase)
- README rewrite (planned for later)
- Image asset remaking (user will handle separately)
- Upstream historical notices and links

### User Stories

1. As a new user, I want to install Jesselicious as a fresh app without any GymMane baggage.
2. As a GymMane user, I want to import my existing data into Jesselicious without losing my history.
3. As a trainer, I want to create a profile, list my services, and manage trainees on the platform.
4. As a trainee, I want to browse trainers, read reviews, and optionally use AI coaching.
5. As a user, I want the app to work fully offline without requiring a server account.

### Functional Requirements

- **Package ID Change**: Core app uses `com.jesselicious.app`; module apps (Move, Yoga, Dance) will use their own namespaces (`com.jesselicious.move`, etc.) to establish each as a distinct product.
- **Data Importer**: Users can import GymMane backup ZIP files; the importer validates and migrates all data including workouts, routines, nutrition, notes, media, etc.
- **Offline-First**: Core workout logging works without any network connection.
- **Optional Server**: Users can optionally connect to jesselicious.com for cloud sync, trainer features, and AI.
- **Attribution**: "Based on GymMane by InlitX" must be visible in the About screen and ATTRIBUTION.md.

### Non-Functional Requirements

- **Privacy**: No mandatory network access; the app can function without INTERNET permission for core features.
- **Compatibility**: The importer supports GymMane backup formats from recent versions.
- **Performance**: Import should complete within seconds for typical user data.
- **Legal**: GPL-3.0 license maintained; attribution preserved as required by ADDITIONAL_TERMS.md.

# Delivery Steps

### ✓ Step 1: Change package IDs and identifiers
Update all package IDs, bundle identifiers, and internal identifiers from com.gymmane.app to com.jesselicious.app (core app) across Android, iOS, and Dart code.
- Android: update applicationId and namespace in android/app/build.gradle.kts, update package declarations in Kotlin files (com/gymmane/app/ → com/jesselicious/app/), rename directory structure.
- iOS: update PRODUCT_BUNDLE_IDENTIFIER in ios/Runner.xcodeproj/project.pbxproj (com.gymmane.app → com.jesselicious.app), update app group identifiers.
- Dart: update pubspec.yaml name from gymmane to jesselicious, update method channel prefixes (gymmane/ → jesselicious/).
- Module apps (Move, Yoga, Dance) will be separate Flutter modules with their own package IDs (com.jesselicious.move, etc.).
- URL scheme: change gymmane:// to jesselicious:// in Android manifest and iOS Info.plist.
- Rename files: GymManeApplication.kt → JesseliciousApplication.kt, gymmane_app.dart → jesselicious_app.dart, etc.
- Update server pubspec.yaml name from gymmane_server to jesselicious_server.

### ✓ Step 2: Complete rebranding of visible text and assets
Finish rebranding all visible text, labels, and references from GymMane to Jesselicious while preserving attribution.
- Update remaining ARB localization files (22 languages) for any missed GymMane references in visible text.
- Update web manifest, server pages, and store metadata (already done in previous session, verify completeness).
- Ensure ATTRIBUTION.md is complete and referenced in About screen.
- Update CONTRIBUTING.md, TRANSLATING.md, WEAR.md, SELFHOST.md, and other documentation.
- Update GitHub issue templates and other project metadata.
- Verify that GymMane references remain only where intentional: attribution, Scanner app references, backup compatibility, and upstream URLs.

### ✓ Step 3: Build GymMane data importer
Create an importer that allows users to import their GymMane backup data into the new Jesselicious app.
- Create lib/services/gymmane_importer.dart that reads GymMane backup ZIP files (gymmane.json format).
- Reuse the existing applyBackup() infrastructure from fit_state.dart since the data format is compatible.
- Add a UI screen for importing: Settings → Data & backup → Import from GymMane.
- Handle media files (images, videos, etc.) from the backup ZIP.
- Add validation to ensure the backup is from a compatible version.
- Update the backup export to use jesselicious.json entry name (but still read gymmane.json for imports).
- Add tests for the importer with sample GymMane backup data.

### ✓ Step 4: Outline new server architecture
Design the new PHP/MariaDB server architecture for jesselicious.com with trainer marketplace, AI, and user management.
- Create a server/ directory with PHP source and a database schema (MariaDB/MySQL).
- Define user models: Trainee, Trainer, with authentication and authorization.
- Design trainer marketplace: profiles, ratings, testimonials, blogs, services.
- Plan trainer-trainee relationships: follow-up, updates, messaging.
- Design AI integration: optional Gemini AI key storage, AI coaching endpoints.
- Create RESTful API endpoints for the app to sync with the server (optional, offline-first).
- Design database schema with tables for users, trainers, trainees, ratings, testimonials, blogs, workouts, etc.
- Keep the server as a separate concern from the app; the app remains offline-first.