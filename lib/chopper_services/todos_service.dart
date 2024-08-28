import 'package:chopper/chopper.dart';

part 'todos_service.chopper.dart';

@ChopperApi(baseUrl: '/todos')
abstract class TodosService extends ChopperService {
  @Get()
  Future<Response> getTodos();

  @Get(path: '/{id}')
  Future<Response> getPostById(@Path('id') int id);

  static TodosService create() {
    final ChopperClient client = ChopperClient(
        baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
        services: [_$TodosService()],
        converter: const JsonConverter());
    return _$TodosService(client);
  }
}
