import 'package:flutter/material.dart';
import 'package:wassalni/core/theme/wassalni_colors.dart';

/// WASSALNI Premium Theme Configuration
/// Dark mode by default with luxurious gold accents
class WassalniTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: WassalniColors.gold,
      scaffoldBackgroundColor: WassalniColors.deepBlack,
      colorScheme: ColorScheme.dark(
        primary: WassalniColors.gold,
        secondary: WassalniColors.goldLight,
        tertiary: WassalniColors.goldDark,
        surface: WassalniColors.darkSurface,
        background: WassalniColors.deepBlack,
        error: WassalniColors.error,
      ),
      // Text Themes
      textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: WassalniColors.textPrimary,
        ),
        displayMedium: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: WassalniColors.textPrimary,
        ),
        displaySmall: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: WassalniColors.textPrimary,
        ),
        headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: WassalniColors.textPrimary,
        ),
        headlineMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: WassalniColors.textPrimary,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: WassalniColors.textPrimary,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: WassalniColors.textSecondary,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: WassalniColors.textTertiary,
        ),
        labelLarge: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: WassalniColors.textPrimary,
        ),
      ),
      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: WassalniColors.darkSurface,
        foregroundColor: WassalniColors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: WassalniColors.textPrimary,
        ),
      ),
      // Cards
      cardTheme: CardTheme(
        color: WassalniColors.darkSurface2,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WassalniColors.gold,
          foregroundColor: WassalniColors.deepBlack,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: WassalniColors.gold,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(
            color: WassalniColors.gold,
            width: 1.5,
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: WassalniColors.darkSurface2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: WassalniColors.divider,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: WassalniColors.divider,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: WassalniColors.gold,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: WassalniColors.error,
            width: 1,
          ),
        ),
        hintStyle: const TextStyle(
          fontSize: 14,
          color: WassalniColors.textTertiary,
        ),
      ),
      // Other themes
      dividerTheme: const DividerThemeData(
        color: WassalniColors.divider,
        thickness: 1,
      ),
    );
  }
}
