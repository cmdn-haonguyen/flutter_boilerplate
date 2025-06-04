import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import 'package:flutter_boilerplate/data/repositories/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<FetchMovies>(getNowPlayingMovies);
  }

  Future<void> getNowPlayingMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await repository.getNowPlayingMovies();
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError("Failed to fetch movies: $e"));
    }
  }
}
