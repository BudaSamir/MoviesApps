// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:watch_cloud/movies/domain/entities/movies.dart';
import 'package:watch_cloud/movies/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase({required this.baseMoviesRepository});

  Future<List<Movies>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
