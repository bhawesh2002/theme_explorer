import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/chopper_services/todos_service.dart';
import 'package:theme_explorer/screens/todo_details_screen.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodosService todosService = Provider.of<TodosService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: FutureBuilder(
          future: todosService.getTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error while fecthing Data: ${snapshot.error}"),
              );
            } else {
              final List todos = json.decode(snapshot.data!.bodyString);
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              TodoDetailsScreen(todoId: index + 1)));
                    },
                    title: Text(todos[index]['title']),
                    trailing: todos[index]['completed'] == true
                        ? const Icon(Icons.check)
                        : const Icon(Icons.close),
                  );
                },
              );
            }
          }),
    );
  }
}
