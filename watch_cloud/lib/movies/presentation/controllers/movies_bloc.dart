import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_cloud/core/utils/enums.dart';
import 'package:watch_cloud/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:watch_cloud/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:watch_cloud/movies/domain/usecases/get_up_coming_movies_usecase.dart';

import '../../domain/usecases/get_now_playing_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetUpComingMoviesUseCase getUpComingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase, this.getUpComingMoviesUseCase)
      : super(const MoviesState()) {
    // Now Playing Movies
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(); // Callable Class
      result.fold(
          (l) => emit(state.copyWith(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                nowPlayingState: RequestState.loaded,
                nowPlayingMovies: r,
              )));
    });
    // Popular Movies
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(); // Callable Class
      result.fold(
          (l) => emit(state.copyWith(
                popularState: RequestState.error,
                popularMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                popularState: RequestState.loaded,
                popularMovies: r,
              )));
    });
    // Top Rated Movies
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(); // Callable Class
      result.fold(
          (l) => emit(state.copyWith(
                topRatedState: RequestState.error,
                topRatedMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                topRatedState: RequestState.loaded,
                topRatedMovies: r,
              )));
    });
    // Up Coming Movies
    on<GetUpComingMoviesEvent>((event, emit) async {
      final result = await getUpComingMoviesUseCase(); // Callable Class
      result.fold(
          (l) => emit(state.copyWith(
                upComingState: RequestState.error,
                upComingMessage: l.message,
              )),
          (r) => emit(state.copyWith(
                upComingState: RequestState.loaded,
                upComingMovies: r,
              )));
    });
  }
}