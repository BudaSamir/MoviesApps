// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:watch_cloud/movies/domain/entities/movies.dart';
import 'package:watch_cloud/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});

  Future<List<Movies>> execut() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
