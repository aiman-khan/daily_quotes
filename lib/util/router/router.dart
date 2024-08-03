import 'package:daily_quotes/features/quote/presentation/views/home/home_view.dart';
import 'package:daily_quotes/features/splash/presentation/splash_view.dart';
import 'package:daily_quotes/util/router/paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomeView();
      },
    ),
  ],
);
