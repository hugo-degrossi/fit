import 'package:fit/themes/fit_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeCustom = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: HexColor.fromHex('#232931'),
    primary: HexColor.fromHex('#393E46'),
    secondary: HexColor.fromHex('#4ECCA3'),
    tertiary: HexColor.fromHex('#EEEEEE'),
  ),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.croissantOne(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: HexColor.fromHex('#EEEEEE'),
      ),
      displayMedium: GoogleFonts.urbanist(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey[300]!,
      ),
      titleMedium: GoogleFonts.urbanist(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.grey[400]!,
        letterSpacing: 1,
      ),
      displaySmall: GoogleFonts.kalam(
        color: Colors.grey[400]!,
      ),
      bodySmall: GoogleFonts.urbanist(
        color: Colors.grey[400]!,
        fontSize: 14,
      )),
  extensions: <ThemeExtension<dynamic>>[
    FitAppColors(
      accent: const Color.fromARGB(255, 155, 23, 98),
      inverted: Colors.white,
      delete: Colors.red[900],
    )
  ],
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return GoogleFonts.urbanist();
      }
      return GoogleFonts.urbanist();
    }),
  ),
);

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
