import 'package:flutter/material.dart';
import 'package:new_test/presentation/resources/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: AppColors.red,
      secondary: AppColors.red,
      background: AppColors.darkDeepBlue,
      error: AppColors.red,
      surface: AppColors.lightDeepBlue,
      brightness: Brightness.dark,
      onPrimary: AppColors.red,
      onSecondary: AppColors.red,
      onError: AppColors.red,
      onBackground: AppColors.darkDeepBlue,
      onSurface: AppColors.lightDeepBlue,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 25.0,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 23.0,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 21.0,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 19.0,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 17.0,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 15.0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightDeepBlue,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(color: AppColors.lightDeepBlue)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(color: AppColors.lightDeepBlue)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(17),
          borderSide: const BorderSide(color: AppColors.lightDeepBlue)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      hintStyle: TextStyle(
        color: AppColors.white.withOpacity(0.2),
        fontFamily: 'Hacen Tunisia',
        height: 1,
        fontSize: 17.0,
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll<Color>(AppColors.red),
        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
        ),
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(double.infinity, 60),
        ),
      ),
    ),
  );
}
