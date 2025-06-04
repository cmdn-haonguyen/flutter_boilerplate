import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/Router/app_router.dart';
import 'package:flutter_boilerplate/data/repositories/movie_repository.dart';
import 'package:flutter_boilerplate/presentation/bloc/movie_bloc.dart';
import 'package:flutter_boilerplate/presentation/bloc/movie_event.dart';
import 'core/network/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final apiService = ApiService();
  final movieRepository = MovieRepository(apiService);

  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  const MyApp({
    super.key,
    required this.movieRepository,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: movieRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => MovieBloc(movieRepository)..add(FetchMovies()))
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
