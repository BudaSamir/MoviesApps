import 'package:breaking_bad/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersAPI {
  late Dio dio;

  CharactersAPI() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20));

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response response = await dio.get('character');
      print(response.data["results"].toString());
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
