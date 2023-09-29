import 'package:fit/themes/fit_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeCustom = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: HexColor.fromHex('#FEFCF3'),
    primary: HexColor.fromHex('#F5EBE0'),
    secondary: HexColor.fromHex('#779BA8'),
    tertiary: HexColor.fromHex('#DBA39A'),
  ),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.croissantOne(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: HexColor.fromHex('#DBA39A'),
      ),
      displayMedium: GoogleFonts.urbanist(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: HexColor.fromHex('#DBA39A'),
        letterSpacing: 1,
      ),
      titleMedium: GoogleFonts.urbanist(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: HexColor.fromHex('#DBA39A'),
        letterSpacing: 1,
      ),
      displaySmall: GoogleFonts.kalam(
        color: HexColor.fromHex('#DBA39A'),
      ),
      bodySmall: GoogleFonts.urbanist(
        color: HexColor.fromHex('#DBA39A'),
        fontSize: 14,
      )),
  extensions: <ThemeExtension<dynamic>>[
    FitAppColors(
      accent: const Color.fromRGBO(137, 16, 85, 1),
      inverted: HexColor.fromHex('#422B28'),
      delete: Colors.red[200],
    )
  ],
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return GoogleFonts.urbanist(
            color: HexColor.fromHex('#779BA8'), fontSize: 16);
      }
      return GoogleFonts.urbanist(
          color: HexColor.fromHex('#DBA39A'), fontSize: 14);
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
