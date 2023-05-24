import 'package:dartz/dartz.dart';
import 'package:watch_cloud/core/error/failure.dart';
import 'package:watch_cloud/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>>  getNowPlayingMovies();
  Future<Either<Failure, List<Movies>>>  getPopularMovies();
  Future<Either<Failure, List<Movies>>>  getTopRatedMovies();
  Future<Either<Failure, List<Movies>>>  getUpComingMovies();
}
