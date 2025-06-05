import 'package:flutter_boilerplate/domain/usecase/get_now_playing_movies.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_boilerplate/core/network/api_service.dart';
import 'package:flutter_boilerplate/domain/repository/movie_repository.dart';
import 'package:flutter_boilerplate/data/repositories/movie_repository_Impl.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Core
  getIt.registerLazySingleton(() => ApiService());

  // Repositories
  getIt.registerLazySingleton<MovieRepositoryImpl>(
    () => MovieRepositoryImpl(getIt<ApiService>()),
  );

  // Use Case
  getIt.registerLazySingleton<GetNowPlayingMovies>(
      () => GetNowPlayingMovies(getIt<MovieRepositoryImpl>())
  );
}