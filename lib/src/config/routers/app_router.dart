import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../main.dart';
import '../../screen/home/home_screen.dart';
import '../../screen/login/login_screen.dart';
import '../../screen/splash/splash_screen.dart';
import 'custom_next_screen_router.dart';
import 'name_router.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const MyApp();
    switch (settings.name) {
      case NameRouter.START_SCREEN:
        return MaterialPageRoute(
          builder: (_) => startScreen,
        );
      case NameRouter.HOME_SCREEN:
        return CustomNextScreenRouter(
          direction: AxisDirection.right,
          child: const HomeScreen(),
        );
      case NameRouter.LOGIN_SCREEN:
        return CustomNextScreenRouter(
          direction: AxisDirection.right,
          child: const LoginScreen(),
        );
      default:
        return null;
    }
  }
}

class AppGoRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: NameRouter.START_SCREEN,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: NameRouter.HOME_SCREEN,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            path: NameRouter.LOGIN_SCREEN,
            builder: (BuildContext context, GoRouterState state) {
              return LoginScreen(
                test: state.extra as TestClass,
              );
            },
          ),
        ],
      ),
    ],
  );
}
