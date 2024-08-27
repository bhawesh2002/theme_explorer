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

  void changeThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
