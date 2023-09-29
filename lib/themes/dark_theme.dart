import 'package:fit/themes/fit_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[700]!,
    secondary: Colors.grey[800]!,
    tertiary: Colors.grey[300]!,
  ),
  textTheme: TextTheme(
      displayLarge: GoogleFonts.croissantOne(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white,
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
