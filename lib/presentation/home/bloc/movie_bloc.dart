import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/domain/usecase/get_now_playing_movies.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  MovieBloc(this.getNowPlayingMovies) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());

      try {
        final movies = await getNowPlayingMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError("Failed to fetch movies: $e"));
      }
    });
  }
}
