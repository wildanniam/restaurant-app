import 'package:flutter/material.dart';
import 'package:restaurant_app/style/colors/restaurant_color.dart';
import 'package:restaurant_app/style/typography/restaurant_text_style.dart';

class RestaurantTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: TourismTextStyles.displayLarge,
      displayMedium: TourismTextStyles.displayMedium,
      displaySmall: TourismTextStyles.displaySmall,
      headlineLarge: TourismTextStyles.headlineLarge,
      headlineMedium: TourismTextStyles.headlineMedium,
      headlineSmall: TourismTextStyles.headlineSmall,
      titleLarge: TourismTextStyles.titleLarge,
      titleMedium: TourismTextStyles.titleMedium,
      titleSmall: TourismTextStyles.titleSmall,
      bodyLarge: TourismTextStyles.bodyLargeBold,
      bodyMedium: TourismTextStyles.bodyLargeMedium,
      bodySmall: TourismTextStyles.bodyLargeRegular,
      labelLarge: TourismTextStyles.labelLarge,
      labelMedium: TourismTextStyles.labelMedium,
      labelSmall: TourismTextStyles.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleLarge,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColor.white.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColor.primary.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }
}
