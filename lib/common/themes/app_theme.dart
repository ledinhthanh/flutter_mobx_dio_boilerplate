import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx_dio_boilerplate/common/models/theme_palette.dart';
import 'package:flutter_mobx_dio_boilerplate/common/themes/colors.dart';
import 'package:flutter_mobx_dio_boilerplate/constants/font_family.dart';
import 'package:flutter_mobx_dio_boilerplate/utils/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final ThemeMode mode;

  AppTheme({
    required this.mode,
  });

  /// theme palatte. Use [palette] to pick colors use across the app.
  ThemePalette get palette {
    if (mode == ThemeMode.light) {
      /// LIGHT theme mode color palette
      return ThemePalette(
        accentColor: AppColors.blue,
        secondaryColor: AppColors.blue,
        primaryColor: AppColors.white,
        backgroundColor: AppColors.white,
        textColor: AppColors.black1,
        textContrastColor: AppColors.white,
        rowTextContrastColor: AppColors.white,
        disabledColor: AppColors.lightDisabled,
        hoverColor: AppColors.lightHover,
        splashColor: AppColors.lightSplash,
        captionColor: AppColors.color797,
        sidebarColor: AppColors.colorE6E3E3,
        rowSelectionColor: AppColors.darkBlue,
        alternativeRowColor: AppColors.colorF5F,
        sidebarSelectionColor: AppColors.blue,
        sidebarTileIconColor: AppColors.blue,
        sidebarTileIconContrastColor: AppColors.white,
        sidebarTileTextColor: AppColors.black1,
        sidebarTileTextContrastColor: AppColors.white,
        actionbarIconColor: AppColors.color797,
        tooltipColor: AppColors.colorE6E3E3,
        tooltipTextColor: AppColors.black1,
        progressBackgroundColor: AppColors.colorE5E,
        flatButtonPrimaryColor: AppColors.colorF1F,
      );
      // </------ LIGHT theme mode color palette ----->
    }

    /// DARK theme mode color palette
    return ThemePalette(
      accentColor: AppColors.blue,
      secondaryColor: AppColors.blue,
      primaryColor: AppColors.black1,
      backgroundColor: AppColors.color242024,
      textColor: AppColors.white,
      textContrastColor: AppColors.black1,
      rowTextContrastColor: AppColors.white,
      disabledColor: AppColors.darkDisabled,
      hoverColor: AppColors.darkHover,
      splashColor: AppColors.darkSplash,
      captionColor: AppColors.white.withOpacity(0.7),
      sidebarColor: AppColors.color2D292D,
      rowSelectionColor: AppColors.darkBlue,
      alternativeRowColor: AppColors.color2E2A2E,
      sidebarSelectionColor: AppColors.color464,
      sidebarTileIconColor: AppColors.blue,
      sidebarTileIconContrastColor: AppColors.blue,
      sidebarTileTextColor: AppColors.white,
      sidebarTileTextContrastColor: AppColors.white,
      actionbarIconColor: AppColors.white.withOpacity(0.65),
      tooltipColor: AppColors.color28262B,
      tooltipTextColor: AppColors.white,
      progressBackgroundColor: AppColors.color2E2A2E,
      flatButtonPrimaryColor: AppColors.white.withOpacity(0.35),
    );
    // </------ DARK theme mode color palette ----->
  }

  TextStyle get _originalBodyText1 => GoogleFonts.openSans(
        color: palette.textColor,
      );

  MaterialColor get _primarySwatch => hexColor2MaterialColor(
        color: palette.primaryColor,
      );

  TextTheme get _originalTextTheme {
    if (mode == ThemeMode.dark) {
      return ThemeData.dark().textTheme;
    }

    return ThemeData.light().textTheme;
  }

  IconThemeData get _originalIconTheme {
    if (mode == ThemeMode.dark) {
      return ThemeData.dark().iconTheme;
    }

    return ThemeData.light().iconTheme;
  }

  TextStyle get _bodyTextStyle {
    return TextStyle(
      color: palette.accentColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.quicksand,
    );
  }

  /// Button Theme
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      buttonColor: palette.accentColor,
      splashColor: palette.splashColor,
      disabledColor: palette.disabledColor,
      hoverColor: palette.hoverColor,
    );
  }

  //AppBarTheme
  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: _primarySwatch),
      actionsIconTheme: IconThemeData(color: _primarySwatch),
      titleTextStyle: _bodyTextStyle,
      toolbarTextStyle: const TextStyle(),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        padding: const EdgeInsets.only(left: 24, right: 24),
        backgroundColor: palette.primaryColor,
        minimumSize: const Size(0, 60),
        textStyle: const TextStyle(color: Colors.white),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ).merge(
        ButtonStyle(
          elevation: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.pressed)) return 2;
            return 1;
          }),
        ),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 60),
        padding: const EdgeInsets.only(left: 24, right: 24),
        backgroundColor: palette.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  /// ThemeData
  ThemeData get themeData {
    return ThemeData(
      fontFamily: FontFamily.quicksand,
      appBarTheme: _appBarTheme,
      brightness: mode == ThemeMode.light ? Brightness.light : Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: _originalIconTheme,
      buttonTheme: _buttonTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      primaryColor: palette.primaryColor,
      indicatorColor: palette.accentColor,
      scaffoldBackgroundColor: palette.backgroundColor,
      disabledColor: palette.disabledColor,
      highlightColor: AppColors.orange,
      hintColor: AppColors.grey,
      textTheme: GoogleFonts.quicksandTextTheme(_originalTextTheme).copyWith(
        displayLarge: _originalBodyText1.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w800,
        ),
        titleLarge: _originalBodyText1.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: _originalBodyText1.copyWith(
          fontSize: 16.0,
        ),
        titleSmall: _originalBodyText1.copyWith(
          fontSize: 18.0,
        ),
        bodyLarge: _originalBodyText1.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: _originalBodyText1.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: _originalBodyText1.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          color: palette.captionColor,
        ),
        labelLarge: _originalBodyText1.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: _originalBodyText1.copyWith(),
        headlineSmall: _originalBodyText1.copyWith(),
        labelSmall: _originalBodyText1.copyWith(),
        headlineMedium: _originalBodyText1.copyWith(),
        displaySmall: _originalBodyText1.copyWith(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: _bodyTextStyle.copyWith(color: AppColors.grey, fontSize: 14),
        labelStyle: _bodyTextStyle.copyWith(color: palette.accentColor, fontWeight: FontWeight.normal),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 13,
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
