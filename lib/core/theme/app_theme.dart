import 'package:flutter/material.dart';

part './app_colors.dart';

part './app_fonts.dart';

class AppTheme {
  static ColorScheme get _appColorScheme => ColorScheme.fromSeed(
      seedColor: AppColors.primary, primary: AppColors.primary);

  static AppBarTheme get appBarTheme => const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      );

  static DrawerThemeData get drawerThemeDate => const DrawerThemeData(
        backgroundColor: AppColors.primary,
      );

  static ThemeData get light => ThemeData.light(
        useMaterial3: false,
      ).copyWith(
        colorScheme: _appColorScheme.copyWith(
          primary: AppColors.primary,
          secondary: AppColors.primary,
        ),
        appBarTheme: appBarTheme.copyWith(
          foregroundColor: AppColors.white,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.white,
        drawerTheme: drawerThemeDate,
        brightness: Brightness.light,
        textTheme: AppFonts.defaultTextTheme(ThemeData.light()),
      );
}
