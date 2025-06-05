import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/domain/usecase/get_now_playing_movies.dart';
import 'package:flutter_boilerplate/routers/app_router.dart';
import 'package:flutter_boilerplate/data/repositories/movie_repository_Impl.dart';
import 'package:flutter_boilerplate/presentation/home/bloc/movie_bloc.dart';
import 'package:flutter_boilerplate/presentation/home/bloc/movie_event.dart';
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
            create: (_) => MovieBloc(getIt<GetNowPlayingMovies>())..add(FetchMovies()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
