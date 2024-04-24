// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routers.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $loginPageRoute,
      $tabScreenShell,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginPageRouteExtension._fromState,
    );

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tabScreenShell => ShellRouteData.$route(
      navigatorKey: TabScreenShell.$navigatorKey,
      factory: $TabScreenShellExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/home',
          factory: $HomeScreenRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/home2',
          factory: $HomeScreenRoute2Extension._fromState,
        ),
        GoRouteData.$route(
          path: '/home3',
          factory: $HomeScreenRoute3Extension._fromState,
        ),
      ],
    );

extension $TabScreenShellExtension on TabScreenShell {
  static TabScreenShell _fromState(GoRouterState state) =>
      const TabScreenShell();
}

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeScreenRoute2Extension on HomeScreenRoute2 {
  static HomeScreenRoute2 _fromState(GoRouterState state) =>
      const HomeScreenRoute2();

  String get location => GoRouteData.$location(
        '/home2',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeScreenRoute3Extension on HomeScreenRoute3 {
  static HomeScreenRoute3 _fromState(GoRouterState state) =>
      const HomeScreenRoute3();

  String get location => GoRouteData.$location(
        '/home3',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
