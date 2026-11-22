import 'package:flutter/material.dart';

@immutable
class GymColors extends ThemeExtension<GymColors> {
  const GymColors({
    required this.pageBg,
    required this.bg,
    required this.bgRaised,
    required this.bgRaised2,
    required this.border,
    required this.navBg,
    required this.text,
    required this.textSecondary,
    required this.textTertiary,
    required this.magenta,
    required this.magentaDeep,
    required this.onMagenta,
    required this.magentaSoft,
    required this.magentaShadow,
    required this.teal,
    required this.tealSoft,
    required this.onTeal,
    required this.marigold,
    required this.marigoldSoft,
    required this.onMarigold,
    required this.lavender,
    required this.lavenderSoft,
    required this.onLavender,
    required this.mutedFill,
    required this.heatEmpty,
    required this.info,
    required this.warn,
    required this.danger,
  });

  final Color pageBg;
  final Color bg;
  final Color bgRaised;
  final Color bgRaised2;
  final Color border;
  final Color navBg;
  final Color text;
  final Color textSecondary;
  final Color textTertiary;
  final Color magenta;
  final Color magentaDeep;
  final Color onMagenta;
  final Color magentaSoft;
  final Color magentaShadow;
  final Color teal;
  final Color tealSoft;
  final Color onTeal;
  final Color marigold;
  final Color marigoldSoft;
  final Color onMarigold;
  final Color lavender;
  final Color lavenderSoft;
  final Color onLavender;
  final Color mutedFill;
  final Color heatEmpty;
  final Color info;
  final Color warn;
  final Color danger;

  static const dark = GymColors(
    pageBg: Color(0xFF121218),
    bg: Color(0xFF121218),
    bgRaised: Color(0xFF1E1E28),
    bgRaised2: Color(0xFF2A2A38),
    border: Color(0xFFFFFDF7),
    navBg: Color(0xD9121218),
    text: Color(0xFFFFFDF7),
    textSecondary: Color(0xFFB8B8C8),
    textTertiary: Color(0xFF8A8A9A),
    magenta: Color(0xFFFF2E93),
    magentaDeep: Color(0xFFD01A7A),
    onMagenta: Color(0xFFFFFDF7),
    magentaSoft: Color(0x1AFF2E93),
    magentaShadow: Color(0x80FF2E93),
    teal: Color(0xFF00C4B4),
    tealSoft: Color(0x2900C4B4),
    onTeal: Color(0xFF141414),
    marigold: Color(0xFFFFD23F),
    marigoldSoft: Color(0x29FFD23F),
    onMarigold: Color(0xFF141414),
    lavender: Color(0xFF9B5DE5),
    lavenderSoft: Color(0x299B5DE5),
    onLavender: Color(0xFFFFFDF7),
    mutedFill: Color(0xFF2A2A38),
    heatEmpty: Color(0xFF1E1E28),
    info: Color(0xFF00C4B4),
    warn: Color(0xFFFFD23F),
    danger: Color(0xFFFF2E93),
  );

  static const amoled = GymColors(
    pageBg: Color(0xFF000000),
    bg: Color(0xFF000000),
    bgRaised: Color(0xFF121218),
    bgRaised2: Color(0xFF1E1E28),
    border: Color(0xFFFFFDF7),
    navBg: Color(0xE6000000),
    text: Color(0xFFFFFDF7),
    textSecondary: Color(0xFFB8B8C8),
    textTertiary: Color(0xFF8A8A9A),
    magenta: Color(0xFFFF2E93),
    magentaDeep: Color(0xFFD01A7A),
    onMagenta: Color(0xFFFFFDF7),
    magentaSoft: Color(0x1AFF2E93),
    magentaShadow: Color(0x80FF2E93),
    teal: Color(0xFF00C4B4),
    tealSoft: Color(0x2900C4B4),
    onTeal: Color(0xFF141414),
    marigold: Color(0xFFFFD23F),
    marigoldSoft: Color(0x29FFD23F),
    onMarigold: Color(0xFF141414),
    lavender: Color(0xFF9B5DE5),
    lavenderSoft: Color(0x299B5DE5),
    onLavender: Color(0xFFFFFDF7),
    mutedFill: Color(0xFF1A1A20),
    heatEmpty: Color(0xFF121218),
    info: Color(0xFF00C4B4),
    warn: Color(0xFFFFD23F),
    danger: Color(0xFFFF2E93),
  );

  static const light = GymColors(
    pageBg: Color(0xFFFFFDF7),
    bg: Color(0xFFFFFDF7),
    bgRaised: Color(0xFFFFFDF7),
    bgRaised2: Color(0xFFF5F4FF),
    border: Color(0xFF141414),
    navBg: Color(0xF2FFFDF7),
    text: Color(0xFF141414),
    textSecondary: Color(0xFF4A4A58),
    textTertiary: Color(0xFF8A8A9A),
    magenta: Color(0xFFFF2E93),
    magentaDeep: Color(0xFFD01A7A),
    onMagenta: Color(0xFFFFFDF7),
    magentaSoft: Color(0x1AFF2E93),
    magentaShadow: Color(0x1F141414),
    teal: Color(0xFF00C4B4),
    tealSoft: Color(0x2900C4B4),
    onTeal: Color(0xFF141414),
    marigold: Color(0xFFFFD23F),
    marigoldSoft: Color(0x29FFD23F),
    onMarigold: Color(0xFF141414),
    lavender: Color(0xFF9B5DE5),
    lavenderSoft: Color(0x299B5DE5),
    onLavender: Color(0xFFFFFDF7),
    mutedFill: Color(0xFFE2E2EC),
    heatEmpty: Color(0xFFE2E2EC),
    info: Color(0xFF00C4B4),
    warn: Color(0xFFFFD23F),
    danger: Color(0xFFFF2E93),
  );

  @override
  GymColors copyWith({
    Color? pageBg,
    Color? bg,
    Color? bgRaised,
    Color? bgRaised2,
    Color? border,
    Color? navBg,
    Color? text,
    Color? textSecondary,
    Color? textTertiary,
    Color? magenta,
    Color? magentaDeep,
    Color? onMagenta,
    Color? magentaSoft,
    Color? magentaShadow,
    Color? teal,
    Color? tealSoft,
    Color? onTeal,
    Color? marigold,
    Color? marigoldSoft,
    Color? onMarigold,
    Color? lavender,
    Color? lavenderSoft,
    Color? onLavender,
    Color? mutedFill,
    Color? heatEmpty,
    Color? info,
    Color? warn,
    Color? danger,
  }) {
    return GymColors(
      pageBg: pageBg ?? this.pageBg,
      bg: bg ?? this.bg,
      bgRaised: bgRaised ?? this.bgRaised,
      bgRaised2: bgRaised2 ?? this.bgRaised2,
      border: border ?? this.border,
      navBg: navBg ?? this.navBg,
      text: text ?? this.text,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      magenta: magenta ?? this.magenta,
      magentaDeep: magentaDeep ?? this.magentaDeep,
      onMagenta: onMagenta ?? this.onMagenta,
      magentaSoft: magentaSoft ?? this.magentaSoft,
      magentaShadow: magentaShadow ?? this.magentaShadow,
      teal: teal ?? this.teal,
      tealSoft: tealSoft ?? this.tealSoft,
      onTeal: onTeal ?? this.onTeal,
      marigold: marigold ?? this.marigold,
      marigoldSoft: marigoldSoft ?? this.marigoldSoft,
      onMarigold: onMarigold ?? this.onMarigold,
      lavender: lavender ?? this.lavender,
      lavenderSoft: lavenderSoft ?? this.lavenderSoft,
      onLavender: onLavender ?? this.onLavender,
      mutedFill: mutedFill ?? this.mutedFill,
      heatEmpty: heatEmpty ?? this.heatEmpty,
      info: info ?? this.info,
      warn: warn ?? this.warn,
      danger: danger ?? this.danger,
    );
  }

  @override
  GymColors lerp(GymColors? other, double t) {
    if (other == null) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return GymColors(
      pageBg: c(pageBg, other.pageBg),
      bg: c(bg, other.bg),
      bgRaised: c(bgRaised, other.bgRaised),
      bgRaised2: c(bgRaised2, other.bgRaised2),
      border: c(border, other.border),
      navBg: c(navBg, other.navBg),
      text: c(text, other.text),
      textSecondary: c(textSecondary, other.textSecondary),
      textTertiary: c(textTertiary, other.textTertiary),
      magenta: c(magenta, other.magenta),
      magentaDeep: c(magentaDeep, other.magentaDeep),
      onMagenta: c(onMagenta, other.onMagenta),
      magentaSoft: c(magentaSoft, other.magentaSoft),
      magentaShadow: c(magentaShadow, other.magentaShadow),
      teal: c(teal, other.teal),
      tealSoft: c(tealSoft, other.tealSoft),
      onTeal: c(onTeal, other.onTeal),
      marigold: c(marigold, other.marigold),
      marigoldSoft: c(marigoldSoft, other.marigoldSoft),
      onMarigold: c(onMarigold, other.onMarigold),
      lavender: c(lavender, other.lavender),
      lavenderSoft: c(lavenderSoft, other.lavenderSoft),
      onLavender: c(onLavender, other.onLavender),
      mutedFill: c(mutedFill, other.mutedFill),
      heatEmpty: c(heatEmpty, other.heatEmpty),
      info: c(info, other.info),
      warn: c(warn, other.warn),
      danger: c(danger, other.danger),
    );
  }
}

extension GymColorsX on BuildContext {
  GymColors get gc => Theme.of(this).extension<GymColors>()!;
}
