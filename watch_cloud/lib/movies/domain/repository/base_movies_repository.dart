import 'package:watch_cloud/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepository {
  Future<List<Movies>> getNowPlayingMovies();
  Future<List<Movies>> getPopularMovies();
  Future<List<Movies>> getTopRatedMovies();
  Future<List<Movies>> getUpComingMovies();
}
