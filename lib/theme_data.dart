import 'package:flutter/material.dart';

import 'constants.dart';

class CustomThemeData {
  static ThemeData getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: bgScaffoldColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: bgElevatedButtonColor,
          textStyle: const TextStyle(
            color: fontColor,
            fontSize: 20,
          ),
          elevation: 3,
        ),
      ),
    );
  }
}
