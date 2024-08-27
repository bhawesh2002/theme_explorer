import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/providers/items_provider.dart';
import 'package:theme_explorer/providers/theme_provider.dart';
import 'package:theme_explorer/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => ItemsProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.themeMode,
        theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.scaffoldBGColor,
            colorScheme: const ColorScheme.light()),
        darkTheme: ThemeData(colorScheme: const ColorScheme.dark()),
        home: const HomeScreen());
  }
}
