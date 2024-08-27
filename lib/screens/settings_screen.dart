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
        children: [
          ListTile(
            onTap: () {
              themeProvider.changeThemeMode();
            },
            title: Text(
                "Current Theme Mode: ${themeProvider.themeMode.toString().split('.')[1].toUpperCase()}"),
            subtitle: const Text("Tap to change Theme Mode"),
          )
        ],
      ),
    );
  }
}
