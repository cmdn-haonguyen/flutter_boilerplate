import 'package:flutter_boilerplate/domain/entity/movie_entity.dart';
import 'package:flutter_boilerplate/domain/repository/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<List<MovieEntity>> call() {
    return repository.getNowPlayingMovies();
  }
}