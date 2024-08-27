import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color _scaffoldBGColor = Colors.white;
  ThemeMode _themeMode = ThemeMode.light;

  Color get scaffoldBGColor => _scaffoldBGColor;
  ThemeMode get themeMode => _themeMode;

  void changeScaffoldColor({required Color color}) {
    _scaffoldBGColor = color;
    notifyListeners();
  }

  /// ThemeMode? themeMode: change the theme to specified theme mode
  ///
  /// if not specified the theme mode will be toggled
  void changeThemeMode({ThemeMode? themeMode}) {
    _themeMode = themeMode ??
        (_themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    notifyListeners();
  }
}
