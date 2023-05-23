import 'package:watch_cloud/movies/domain/entities/movies.dart';
import 'package:watch_cloud/movies/domain/repository/base_movies_repository.dart';

class GetUpComingMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;

  const GetUpComingMoviesUseCase({ required this.baseMoviesRepository});

  Future<List<Movies>> execute() async{
    return await baseMoviesRepository.getUpComingMovies();
  }
}