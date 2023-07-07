import '/presentation/resources/color_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // mainColors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryLight,

    // cardTheme
    cardTheme: CardTheme(
      color: ColorManager.white,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grey,
    ),

    // app bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      shadowColor: ColorManager.primaryLight,
      elevation: AppSize.s4,
      titleTextStyle: getRegularTextStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),

    // buttons Theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      disabledColor: ColorManager.grey1,
      highlightColor: ColorManager.primaryLight,
      splashColor: ColorManager.primaryLight,
      shape: const StadiumBorder(),
    ),

    //elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s17,
        ),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    // textTheme
    textTheme: TextTheme(
      displayLarge: getLightTextStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s22),
      displayMedium: getMediumTextStyle(
          color: ColorManager.primary, fontSize: FontSizeManager.s16),
      headlineMedium: getRegularTextStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s14),
      titleMedium: getSemiBoldTextStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s16,
      ),
      bodyLarge: getRegularTextStyle(color: ColorManager.grey1),
      bodyMedium: getRegularTextStyle(color: ColorManager.grey),
      bodySmall: getRegularTextStyle(color: ColorManager.grey1),
    ),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint text style
      hintStyle: getRegularTextStyle(
        color: ColorManager.grey,
        fontSize: FontSizeManager.s14,
      ),

      // label text style
      labelStyle: getMediumTextStyle(
        color: ColorManager.grey,
        fontSize: FontSizeManager.s14,
      ),

      //error text style
      errorStyle: getRegularTextStyle(
        color: ColorManager.error,
        fontSize: FontSizeManager.s14,
      ),

      //enabled border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //disabled border style
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey1,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //focused error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
