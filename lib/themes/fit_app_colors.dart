import 'package:flutter/material.dart';

@immutable
class FitAppColors extends ThemeExtension<FitAppColors> {
  const FitAppColors({
    required this.accent,
    required this.delete,
    required this.inverted,
  });

  final Color? accent;
  final Color? delete;
  final Color? inverted;

  @override
  FitAppColors copyWith({Color? brandColor, Color? danger, Color? inverted}) {
    return FitAppColors(accent: accent, delete: delete, inverted: inverted);
  }

  @override
  FitAppColors lerp(FitAppColors? other, double t) {
    if (other is! FitAppColors) {
      return this;
    }
    return FitAppColors(
      accent: Color.lerp(accent, other.accent, t),
      delete: Color.lerp(delete, other.delete, t),
      inverted: Color.lerp(inverted, other.inverted, t),
    );
  }
}
