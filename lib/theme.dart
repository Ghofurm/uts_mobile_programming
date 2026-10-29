import 'package:flutter/material.dart';

const Color coffeeDark = Color(0xFF2D1A12);
const Color coffeeBrown = Color(0xFF6F4E37);
const Color coffeeMedium = Color(0xFF9C7A5B);
const Color caramel = Color(0xFFC08552);
const Color latte = Color(0xFFD9BFA3);
const Color cream = Color(0xFFF6EFE6);
const Color creamDark = Color(0xFFEADCCB);
const Color cardCream = Color(0xFFFFFBF5);

ThemeData buildKopiTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: coffeeBrown,
    brightness: Brightness.light,
  ).copyWith(primary: coffeeBrown, secondary: caramel, surface: cream);

  final base = ThemeData(colorScheme: scheme, scaffoldBackgroundColor: cream);

  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: cream,
      surfaceTintColor: Colors.transparent,
      foregroundColor: coffeeDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: coffeeDark,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: base.textTheme.apply(
      bodyColor: coffeeDark,
      displayColor: coffeeDark,
    ),
  );
}
