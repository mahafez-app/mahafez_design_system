import 'package:flutter/material.dart';

import 'mahafez_color_extension.dart';
import 'mahafez_colors.dart';
import 'mahafez_spacing.dart';

/// Preconfigured Light and Dark Material 3 ThemeData with Cairo typography.
final class MahafezTheme {
  const MahafezTheme._();

  static ThemeData light() => ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme(
      brightness: .light,
      primary: MahafezColors.primary,
      onPrimary: MahafezColors.onPrimary,
      primaryContainer: MahafezColors.primaryContainer,
      onPrimaryContainer: MahafezColors.onPrimaryContainer,
      secondary: MahafezColors.secondary,
      onSecondary: MahafezColors.onSecondary,
      secondaryContainer: MahafezColors.secondaryContainer,
      onSecondaryContainer: MahafezColors.onSecondaryContainer,
      tertiary: MahafezColors.tertiary,
      onTertiary: MahafezColors.onTertiary,
      tertiaryContainer: MahafezColors.tertiaryContainer,
      onTertiaryContainer: MahafezColors.onTertiaryContainer,
      error: MahafezColors.error,
      onError: MahafezColors.onError,
      errorContainer: MahafezColors.errorContainer,
      onErrorContainer: MahafezColors.onErrorContainer,
      surface: MahafezColors.surface,
      onSurface: MahafezColors.onSurface,
      surfaceContainerHighest: MahafezColors.surfaceContainerHighest,
      surfaceContainer: MahafezColors.surfaceContainer,
      onSurfaceVariant: MahafezColors.onSurfaceVariant,
      outline: MahafezColors.outline,
      outlineVariant: MahafezColors.outlineVariant,
      shadow: Color(0x1A111C2D),
      scrim: Color(0x66111C2D),
      inverseSurface: MahafezColors.inverseSurface,
      onInverseSurface: MahafezColors.onInverseSurface,
      inversePrimary: MahafezColors.inversePrimary,
      surfaceTint: MahafezColors.surfaceTint,
    ),
    textTheme: _textTheme,
    extensions: const [MahafezColorExtension.light()],
    scaffoldBackgroundColor: MahafezColors.surface,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: MahafezColors.white,
      surfaceTintColor: MahafezColors.white,
      iconTheme: IconThemeData(color: MahafezColors.primary),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: MahafezColors.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: MahafezColors.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: MahafezColors.primary, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: MahafezSpacing.lg,
        vertical: MahafezSpacing.lg,
      ),
      filled: true,
      fillColor: MahafezColors.white,
    ),
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme(
      brightness: .dark,
      primary: MahafezColors.primaryFixedDim,
      onPrimary: MahafezColors.onPrimaryFixed,
      primaryContainer: MahafezColors.onPrimaryFixedVariant,
      onPrimaryContainer: MahafezColors.primaryFixed,
      secondary: MahafezColors.secondaryFixedDim,
      onSecondary: MahafezColors.onSecondaryFixed,
      secondaryContainer: MahafezColors.onSecondaryFixedVariant,
      onSecondaryContainer: MahafezColors.secondaryFixed,
      tertiary: MahafezColors.tertiaryFixedDim,
      onTertiary: MahafezColors.onTertiaryFixed,
      tertiaryContainer: MahafezColors.onTertiaryFixedVariant,
      onTertiaryContainer: MahafezColors.tertiaryFixed,
      error: MahafezColors.error,
      onError: MahafezColors.onError,
      errorContainer: MahafezColors.onErrorContainer,
      onErrorContainer: MahafezColors.errorContainer,
      surface: MahafezColors.darkSurface,
      onSurface: MahafezColors.darkOnSurface,
      surfaceContainerHighest: MahafezColors.darkSurfaceContainerHighest,
      surfaceContainer: MahafezColors.darkSurfaceContainer,
      onSurfaceVariant: MahafezColors.darkOnSurfaceVariant,
      outline: MahafezColors.darkOutline,
      outlineVariant: MahafezColors.darkOutlineVariant,
      shadow: Color(0xCC000000),
      scrim: Color(0xFF000000),
      inverseSurface: MahafezColors.surface,
      onInverseSurface: MahafezColors.onSurface,
      inversePrimary: MahafezColors.primary,
      surfaceTint: MahafezColors.primaryFixedDim,
    ),
    textTheme: _textTheme,
    extensions: const [MahafezColorExtension.dark()],
    scaffoldBackgroundColor: MahafezColors.darkSurface,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: MahafezColors.darkSurface,
      surfaceTintColor: MahafezColors.darkSurface,
      iconTheme: IconThemeData(color: MahafezColors.primaryFixedDim),
    ),
  );

  // Cairo font hierarchy
  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.25,
      fontFamily: 'Cairo',
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      fontFamily: 'Cairo',
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w800,
      fontFamily: 'Cairo',
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: 'Cairo',
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: 'Cairo',
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      fontFamily: 'Cairo',
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      fontFamily: 'Cairo',
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamily: 'Cairo',
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      fontFamily: 'Cairo',
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      fontFamily: 'Cairo',
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1,
      fontFamily: 'Cairo',
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
      fontFamily: 'Cairo',
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
      fontFamily: 'Cairo',
    ),
  );
}

