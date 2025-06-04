import 'package:flutter_boilerplate/data/models/movie.dart';
import 'package:flutter_boilerplate/core/network/api_service.dart';

class MovieRepository {
  final ApiService api;

  MovieRepository(this.api);

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response = await api.get('/movie/now_playing', queryParams: {
      'language': 'en-US',
      'page': page,
    });

    final List results = response.data['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  }
}
