import 'package:get_it/get_it.dart';
import 'package:flutter_boilerplate/core/network/api_service.dart';
import 'package:flutter_boilerplate/data/repositories/movie_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => MovieRepository(ApiService()));
}