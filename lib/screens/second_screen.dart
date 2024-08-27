import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/providers/items_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String itemsLength = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Items: $itemsLength"),
      ),
      body: Consumer<ItemsProvider>(
        builder: (context, itemsProvider, _) {
          return ListView.builder(
            itemCount: itemsProvider.items,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Item Number ${index + 1}"),
                subtitle: const Text(
                    "This is the item created by changing the item count on home screen"),
              );
            },
          );
        },
      ),
    );
  }
}
