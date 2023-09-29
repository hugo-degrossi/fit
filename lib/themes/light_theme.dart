import 'package:fit/themes/fit_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey[100]!,
    primary: Colors.grey[700]!,
    secondary: Colors.grey[300]!,
    tertiary: Colors.grey[200]!,
  ),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.croissantOne(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: GoogleFonts.urbanist(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey[700]!,
        letterSpacing: 1,
      ),
      titleMedium: GoogleFonts.urbanist(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.grey[600]!,
        letterSpacing: 1,
      ),
      displaySmall: GoogleFonts.kalam(
        color: Colors.grey[600]!,
      )),
  extensions: <ThemeExtension<dynamic>>[
    FitAppColors(
      accent: const Color.fromRGBO(137, 16, 85, 1),
      inverted: Colors.black,
      delete: Colors.red[200],
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
