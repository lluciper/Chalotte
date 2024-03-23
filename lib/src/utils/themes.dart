import 'package:flutter/material.dart';

import '../config/configs.dart';

enum CurrentTheme { dark, light }

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  unselectedWidgetColor: LuColors.white,
  primaryTextTheme: const TextTheme(
    caption: TextStyle(color: LuColors.white),
  ),
);

final ThemeData lightTheme = ThemeData(
  primaryColor: LuColors.white,
  backgroundColor: LuColors.white,
  unselectedWidgetColor: LuColors.white,
  primaryTextTheme: const TextTheme(
    caption: TextStyle(color: LuColors.white),
  ),
);

enum AppLanguage { vn, en }
