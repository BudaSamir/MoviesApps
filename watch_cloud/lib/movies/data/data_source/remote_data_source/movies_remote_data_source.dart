import 'package:dio/dio.dart';
import 'package:watch_cloud/core/error/exception.dart';
import 'package:watch_cloud/core/network/api_constants.dart';
import 'package:watch_cloud/core/network/error_message_model.dart';
import 'package:watch_cloud/movies/data/models/movies_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<List<MoviesModel>> getUpComingMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource{
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((json) => MoviesModel.fromJson(json)));
    } else {
      final ErrorMessageModel errorMessageModel =
          ErrorMessageModel.fromJson(response.data);
      throw ServerException(errorMessageModel: errorMessageModel);
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((json) => MoviesModel.fromJson(json)));
    } else {
      final ErrorMessageModel errorMessageModel =
      ErrorMessageModel.fromJson(response.data);
      throw ServerException(errorMessageModel: errorMessageModel);
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((json) => MoviesModel.fromJson(json)));
    } else {
      final ErrorMessageModel errorMessageModel =
      ErrorMessageModel.fromJson(response.data);
      throw ServerException(errorMessageModel: errorMessageModel);
    }
  }

  @override
  Future<List<MoviesModel>> getUpComingMovies() async {
    final response = await Dio().get(ApiConstants.upComingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((json) => MoviesModel.fromJson(json)));
    } else {
      final ErrorMessageModel errorMessageModel =
      ErrorMessageModel.fromJson(response.data);
      throw ServerException(errorMessageModel: errorMessageModel);
    }
  }
}
