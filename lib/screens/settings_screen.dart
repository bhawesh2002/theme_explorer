import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    themeProvider.changeThemeMode(themeMode: ThemeMode.light);
                  },
                  icon: const Icon(Icons.light_mode),
                  iconSize: 64,
                  color: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.black
                      : Colors.yellow,
                  padding: const EdgeInsets.all(32),
                  style: IconButton.styleFrom(
                      elevation:
                          themeProvider.themeMode == ThemeMode.light ? 22 : 0,
                      shadowColor: Colors.yellowAccent,
                      backgroundColor: themeProvider.themeMode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black)),
              const SizedBox(width: 32),
              IconButton(
                onPressed: () {
                  themeProvider.changeThemeMode(themeMode: ThemeMode.dark);
                },
                icon: const Icon(Icons.dark_mode),
                iconSize: 64,
                color: themeProvider.themeMode == ThemeMode.dark
                    ? Colors.purple
                    : Colors.white,
                padding: const EdgeInsets.all(32),
                style: IconButton.styleFrom(
                  elevation: themeProvider.themeMode == ThemeMode.dark ? 22 : 0,
                  shadowColor: Colors.purpleAccent,
                  backgroundColor: themeProvider.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
