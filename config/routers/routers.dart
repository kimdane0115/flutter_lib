

import 'package:flutter_template/feature/1.auth/presentation/page/login_page.dart';

import '../../core/constants/index.dart';
import '../../feature/2.home/presentation/page/home_screen.dart';
import '../../feature/2.home/presentation/page/home_screen2.dart';
import '../../feature/2.home/presentation/page/home_screen3.dart';
import '../../feature/2.home/presentation/page/tab_screen.dart';
import 'router.dart';

part 'routers.g.dart';

class Routers {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String home2 = '/home2';
  static const String home3 = '/home3';
}

@TypedGoRoute<SplashRoute>(
  path: Routers.splash,
)
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: HomeScreen());
  }
}

@TypedGoRoute<LoginPageRoute>(
  path: Routers.login,
)
class LoginPageRoute extends GoRouteData {
  const LoginPageRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(child: LoginPage());
  }
}

@TypedShellRoute<TabScreenShell>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeScreenRoute>(
      path: Routers.home,
    ),
    TypedGoRoute<HomeScreenRoute2>(
      path: Routers.home2,
    ),
    TypedGoRoute<HomeScreenRoute3>(
      path: Routers.home3,
    ),
  ]
)
class TabScreenShell extends ShellRouteData {
  const TabScreenShell();
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  @override
  Page<void> pageBuilder(BuildContext context, GoRouterState state, Widget navigator) {
    return MaterialPage(
      key: state.pageKey,
      child: TabScreen(child: navigator),
      name: 'tab_screen',
    );
  }
}

class HomeScreenRoute extends GoRouteData {
  const HomeScreenRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomeScreen(),
      name: Routers.home,
    );
  }
}

class HomeScreenRoute2 extends GoRouteData {
  const HomeScreenRoute2();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomeScreen2(),
      name: Routers.home2,
    );
  }
}

class HomeScreenRoute3 extends GoRouteData {
  const HomeScreenRoute3();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomeScreen3(),
      name: Routers.home3,
    );
  }
}