import 'package:flutter_boilerplate/domain/entity/movie_entity.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
    );

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
    );
  }
}