import 'package:flutter/material.dart';

import 'constants.dart';

class CustomThemeData {
  static ThemeData getThemeData() {
    return ThemeData(
      scaffoldBackgroundColor: bgScaffoldColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgElevatedButtonColor,
          textStyle: TextStyle(
            color: fontColor,
            fontSize: 20,
          ),
          elevation: 3,
        ),
      ),
    );
  }
}
