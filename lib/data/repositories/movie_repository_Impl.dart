import 'package:flutter_boilerplate/data/models/movie.dart';
import 'package:flutter_boilerplate/core/network/api_service.dart';
import 'package:flutter_boilerplate/domain/entity/movie_entity.dart';
import 'package:flutter_boilerplate/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService api;

  MovieRepositoryImpl(this.api);

  Future<List<MovieEntity>> getNowPlayingMovies({int page = 1}) async {
    final response = await api.get('/movie/now_playing', queryParams: {
      'language': 'en-US',
      'page': page,
    });

    final List results = response.data['results'];
    return results.map((json) => Movie.fromJson(json).toEntity()).toList();
  }
}
