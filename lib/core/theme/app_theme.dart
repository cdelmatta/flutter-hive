import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF5F3FF),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF5B21B6),      // Roxo intenso
      secondary: Color(0xFF7C3AED),    // Lilás vibrante
      surface: Color(0xFFF5F3FF),      // Fundo das telas
      onPrimary: Colors.white,
      onSurface: Color(0xFF1E1B4B),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF5B21B6),
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF7C3AED),
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF7C3AED),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Color(0xFF5B21B6)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF7C3AED)),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF5B21B6), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF1E1B4B), fontSize: 16),
    ),
  );
}
