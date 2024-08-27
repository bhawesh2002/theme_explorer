import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/providers/items_provider.dart';
import 'package:theme_explorer/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      floatingActionButton: context.read<ItemsProvider>().items > 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                      settings:
                          RouteSettings(arguments: "${itemsProvider.items}")),
                );
              },
              child: const Icon(Icons.list))
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Please specify the number of Items",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(height: 32),
            Text(
              "${itemsProvider.items}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () {
                context.read<ItemsProvider>().incrementItems();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  elevation: 10,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: context.read<ItemsProvider>().items > 0
                  ? () {
                      context.read<ItemsProvider>().decrementItems();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 10,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
