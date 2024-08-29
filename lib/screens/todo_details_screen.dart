import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_explorer/chopper_services/todos_service.dart';

class TodoDetailsScreen extends StatelessWidget {
  final int todoId;
  const TodoDetailsScreen({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Id: $todoId"),
      ),
      body: FutureBuilder(
          future: Provider.of<TodosService>(context).getPostById(todoId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error has Occured: ${snapshot.error}"),
              );
            } else {
              final Map<String, dynamic> todo =
                  json.decode(snapshot.data!.bodyString);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("User ID: ${todo['userId']}"),
                    Text("ID: ${todo['id']}"),
                    Text("Title: ${todo['title']}"),
                    Text("Completed: ${todo['completed']}"),
                  ],
                ),
              );
            }
          }),
    );
  }
}
