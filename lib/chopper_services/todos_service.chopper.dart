// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$TodosService extends TodosService {
  _$TodosService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = TodosService;

  @override
  Future<Response<dynamic>> getTodos() {
    final Uri $url = Uri.parse('/todos');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPostById(int id) {
    final Uri $url = Uri.parse('/todos/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
