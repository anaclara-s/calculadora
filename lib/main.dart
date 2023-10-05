import 'package:flutter/material.dart';

import 'calculator.dart';
import 'theme_data.dart';

void main() => runApp(
      MaterialApp(
        theme: CustomThemeData.getThemeData(),
        home: Calculator(),
      ),
    );
