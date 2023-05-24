import 'package:dartz/dartz.dart';
import 'package:watch_cloud/movies/domain/entities/movies.dart';
import 'package:watch_cloud/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetUpComingMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;

  const GetUpComingMoviesUseCase({ required this.baseMoviesRepository});

  Future<Either<Failure, List<Movies>>>  execute() async{
    return await baseMoviesRepository.getUpComingMovies();
  }
}