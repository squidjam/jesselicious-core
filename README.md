<div align="center">

<img src="docs/screenshots/banner-en.png" alt="Jesselicious — Lift. Log it. Grow." width="860" />

<br/>

<img src="docs/screenshots/icon.png" width="94" alt="Jesselicious" />

# Jesselicious

> **Based on [GymMane](https://github.com/InlitX/GymMane) by InlitX**

A free, offline-first gym log for Android and iOS.<br/>
Tap the muscles you want to train, log your sets and watch your numbers go up.

<br/>

<p>
  <img alt="Android 7.0+" src="https://img.shields.io/badge/Android-7.0%2B-3DDC84?style=flat&logo=android&logoColor=white" />
  <img alt="iOS 15+" src="https://img.shields.io/badge/iOS-15%2B-000000?style=flat&logo=apple&logoColor=white" />
  <img alt="License GPLv3" src="https://img.shields.io/badge/Code-GPLv3-C2410C?style=flat&logo=gnu&logoColor=white" />
  <img alt="Art CC BY-SA 4.0" src="https://img.shields.io/badge/Art-CC%20BY--SA%204.0-8A6B41?style=flat&logo=creativecommons&logoColor=white" />
</p>

</div>

## Attribution

Jesselicious is a fork of [GymMane](https://github.com/InlitX/GymMane) by [InlitX](https://github.com/InlitX).
The original app is excellent — this fork extends it with a trainer marketplace, AI coaching, and optional
cloud features while keeping the core experience offline-first and privacy-respecting.

Full attribution details are in [ATTRIBUTION.md](ATTRIBUTION.md). The code is licensed under
[GPL-3.0](LICENSE) with an [additional term](ADDITIONAL_TERMS.md) requiring this credit. Third-party
asset licenses are listed in [CREDITS.md](CREDITS.md).

## What it does

<table>
<tr>
<td width="50%" valign="top">

### Training

- Tap the muscles on a **body map** and get a session
- Reps, weight and a **rest timer** with your own sound
- Warm-up, drop, failure, rest-pause and cluster sets, with RPE or RIR
- **Supersets** and **plates per side**
- **Routines**, weekly plans and rotations, with days off that keep your streak
- **Progression** per exercise, **deload weeks** and light sessions
- A **voice** that guides your rest (beta)

</td>
<td width="50%" valign="top">

### Progress

- Volume, streaks, weekly goal and **records** for every rep range
- **Strength curves** with estimated 1RM and strength per bodyweight
- An **activity heatmap** and a muscle map of what you trained
- **Your month, recapped**, as a story and a card to share
- **Progress photos** on a timeline
- Bodyweight, **ten body measurements**, steps, sleep and heart rate
- Levels, **medals** and a sticker to share your workout

</td>
</tr>
<tr>
<td width="50%" valign="top">

### Exercises and tools

- **500+ exercises** with animations and instructions
- Browse by muscle, equipment or level, or add **your own**
- Use **your own photo, GIF or video** for any exercise
- **Places**: tell it your kit and it only suggests what fits
- A **training journal** with photos and video
- Twelve **calculators**, five **widgets** and an **NFC sticker** that opens today's workout

</td>
<td width="50%" valign="top">

### Your data

- **CSV** export and a full **ZIP backup**
- Import from **Hevy**, **Strong**, **Lyfta**, **Liftosaur**, **JEFIT**, **StrongLifts**, **FitNotes** or **openGym**
- **Import from GymMane** — bring your existing GymMane backup into Jesselicious
- **Health Connect** in and out, and workouts to **Strava** as a `.fit` file
- No account, no ads, no analytics, no **internet permission**
- **22 languages**, light and dark, kg or lb
- Delete everything in one tap

</td>
</tr>
</table>

## Nutrition (beta)

Calories and macros against your goal, 500+ foods with photos, your own foods
and dishes, water, supplements with dose and stock, meal plans and meal prep.
**Ask any AI for a meal**, paste its answer and Jesselicious turns it into real
food, with nothing sent from the app. No scanner and no online database. Don't
need it? Turn it off in **Settings › Beta**.

Want to scan barcodes? [GymMane Scanner](https://github.com/KingMezzo/GymMane-Scanner)
is a separate community app (MIT) that looks the product up and sends it to
Jesselicious as a new food.

## Planned features

Jesselicious will grow beyond the original GymMane with optional cloud features.
The app remains **offline-first** — these features require an optional account
at [jesselicious.com](https://jesselicious.com).

- **Trainer marketplace** — browse certified trainers, read reviews and testimonials, and hire coaching
- **AI coaching** — connect your own Gemini API key for personalized training advice
- **Trainer-trainee relationships** — trainers can follow up on and update their trainees' progress
- **Trainer blogs** — training tips, nutrition advice, and workout guides from your coach
- **Cloud sync** — optionally back up your data across devices

The server architecture is outlined in [docs/server-architecture.md](docs/server-architecture.md).

## Import from GymMane

If you're migrating from GymMane, Jesselicious can import your existing backup:

1. In GymMane, go to **Settings › Data & backup** and export a ZIP backup
2. Transfer the backup file to your device
3. In Jesselicious, go to **Settings › Data & backup › Import backup**
4. Select the GymMane backup file — your workouts, routines, nutrition data, and notes will be migrated

## Download

Jesselicious is available for Android and iOS. Web and self-hosted versions are also supported.

| Platform | Status |
|---|---|
| Android 7.0+ | Supported |
| iOS 15+ | In progress |
| Web, self-hosted | Supported, see [SELFHOST.md](SELFHOST.md) |
| Wear OS 3+ | Beta, see [WEAR.md](WEAR.md) |

### Self-hosted

The full app also runs in the browser from your own server, laid out for big
screens, with your data in one folder on that machine:

```sh
curl -fsSLO https://raw.githubusercontent.com/InlitX/GymMane/main/compose.yaml
docker compose up -d
```

No Docker? There are one-line installers for Linux, macOS, Windows and
Proxmox VE, a template for Unraid and a compose file you can paste into
Synology, QNAP, TrueNAS, CasaOS or Portainer. Everything, including syncing
with the phone through Syncthing, is in [SELFHOST.md](SELFHOST.md).

## Privacy

Jesselicious doesn't require the internet permission, so your training never leaves
your phone unless you choose to connect to the optional cloud server. The permissions
it asks for are for the rest timer, its notification and the widgets.

## Contributing

Bug reports, ideas and pull requests are welcome. For anything big, open an
issue first. Want to translate? Edit your language's file and send a pull
request, [TRANSLATING.md](TRANSLATING.md) shows how.

```bash
git clone https://github.com/InlitX/GymMane.git
cd jesselicious-core
flutter pub get
flutter build apk --release
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details.

## Support the original project

Jesselicious exists because of the excellent work by InlitX on GymMane. If you
enjoy this app, consider supporting the original creator:

<div align="center">

<a href="https://ko-fi.com/inlitx"><img src="https://ko-fi.com/img/githubbutton_sm.svg" alt="Support InlitX on Ko-fi" height="38" /></a>

<table align="center">
  <tr>
    <td align="center" width="130"><img src="docs/crypto/bitcoin.svg" width="22" alt="Bitcoin" /><br/><sub><b>Bitcoin</b></sub></td>
    <td><code>bc1qm0r4pg8nknnjh3a7n2t63ckafhsz8jdd6qer29</code></td>
  </tr>
  <tr>
    <td align="center" width="130"><img src="docs/crypto/ethereum.svg" width="22" alt="Ethereum" /><br/><sub><b>Ethereum</b></sub></td>
    <td><code>0x34b7A5552132cBca150Ae29c1E632faA49430e1a</code></td>
  </tr>
  <tr>
    <td align="center" width="130"><img src="docs/crypto/solana.svg" width="22" alt="Solana" /><br/><sub><b>Solana</b></sub></td>
    <td><code>DC8dNEUNJhWdtBHBZAn4FTheVC3W4PtkGhbazvtk17Jo</code></td>
  </tr>
  <tr>
    <td align="center" width="130"><img src="docs/crypto/monero.svg" width="22" alt="Monero" /><br/><sub><b>Monero</b></sub></td>
    <td><code>44SECMEf3rfV228kpy3Gs48wLmLXnq231gAMG7ULYoCWBWLYLHdwYV7YFkhMk31DR5P7SRAyRPyhkYaehtgEoajASz7qubq</code></td>
  </tr>
</table>

</div>

## License

The code is [GPL-3.0](LICENSE), with one [additional term](ADDITIONAL_TERMS.md)
under its section 7(b): works based on GymMane must credit it as "Based on
GymMane by InlitX". The exercise art comes from
[Workout Guide](https://github.com/bryllim/workout-guide) by Bryl Lim and from
[Everkinetic](https://github.com/everkinetic/data), the drawings Workout Guide
builds on, and is [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/).
The fonts use the SIL Open Font License. [CREDITS.md](CREDITS.md) has the details.
