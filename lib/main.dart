import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/providers/items_provider.dart';
import 'package:theme_explorer/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsProvider(),
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}
