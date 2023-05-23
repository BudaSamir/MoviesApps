import 'package:dio/dio.dart';
import 'package:watch_cloud/core/error/exception.dart';
import 'package:watch_cloud/core/network/error_message_model.dart';
import 'package:watch_cloud/movies/data/models/movies_model.dart';

class MovieRemoteDataSource {
  getNowPlayingMovies() async {
    final response = await Dio().get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=15c5a86f88b357bac4367a856db0e6f3");
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
          (response.data["results"] as List).map((json) => MoviesModel.fromJson(json)));
    } else{
      final ErrorMessageModel errorMessageModel = ErrorMessageModel.fromJson(response.data);
      throw ServerException(errorMessageModel: errorMessageModel);
    }
  }
}
