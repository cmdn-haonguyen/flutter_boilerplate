import 'package:flutter_boilerplate/domain/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getNowPlayingMovies({int page = 1});
}