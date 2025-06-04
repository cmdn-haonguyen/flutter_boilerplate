import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/Router/app_router.dart';
import 'package:flutter_boilerplate/data/repositories/movie_repository.dart';
import 'package:flutter_boilerplate/presentation/bloc/movie_bloc.dart';
import 'package:flutter_boilerplate/presentation/bloc/movie_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/di/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => MovieBloc(getIt<MovieRepository>())..add(FetchMovies()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
