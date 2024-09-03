import 'package:aviato_consulting_task/utils/ui/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // LIGHT MODE.
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.kWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.kWhite,
      ),
      backgroundColor: Colors.transparent,
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kGray3,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.kGreen),
  );
}
