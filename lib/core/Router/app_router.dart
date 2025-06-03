import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/presentation/pages/favorite_page.dart';
import 'package:flutter_boilerplate/presentation/pages/home_page.dart';
import 'package:flutter_boilerplate/presentation/pages/search_page.dart';

class AppRouter {
  static final _shellKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellKey,
        builder: (context, state, child) {
          final currentLocation = state.uri.path;

          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _calculateSelectedIndex(currentLocation),
              onTap: (index) => _onTap(context, index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
              ],
            ),
          );
        },
        routes: [
          GoRoute(path: '/home', builder: (_, __) => HomePage()),
          GoRoute(path: '/search', builder: (_, __) => SearchPage()),
          GoRoute(path: '/favorite', builder: (_, __) => FavoritePage()),
        ],
      ),
    ],
  );

  static int _calculateSelectedIndex(String location) {
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/favorite')) return 2;
    return 0;
  }

  static void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go('/favorite');
        break;
    }
  }
}
