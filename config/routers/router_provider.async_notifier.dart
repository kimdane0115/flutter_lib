import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/index.dart';
import '../../feature/1.auth/presentation/provider/supabase_auth_provider.async_notifier.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>(
  (ref) {
    ref.listen(
      // supaBaseAuthAsyncNotifierProvider,
      authStreamProvider,
      (previous, next) {
        if (next.isLoading || next.hasError) {
          return;
        }
        final context = rootNavigatorKey.currentContext;
        if (context != null) {
          GoRouter.maybeOf(context)?.refresh();
        }
      },
    );

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: const LoginPageRoute().location,
      routes: $appRoutes,
      // errorPageBuilder: (_, state) {
      //   return MaterialPage(
      //     key: state.pageKey,
      //     child: CustomErrorScreen(
      //       error: state.error,
      //     ),
      //   );
      // },
      redirect: (BuildContext context, GoRouterState goState) async {

        if( goState.uri.toString() != const LoginPageRoute().location) {
          return null;
        }

        final authState = ref.watch(authStreamProvider);
        bool loggedIn = authState.value?.session?.user != null;

        if (authState.value?.session?.isExpired ?? false) {
          AuthResponse result = await Supabase.instance.client.auth.refreshSession();
          result.session?.user != null ? loggedIn = true : loggedIn = false;
        }

        if (loggedIn) {
          return const HomeScreenRoute().location;
        }
        // final auth = ref.read(authAsyncNotifierProvider);
        // if (auth.isLoading || auth.hasError) return null;

        // print('>>>>> auth : ${auth.value}');
        // if (auth.value!.isNotEmpty) {
        //   return const HomeScreenRoute3().location;
        // }
        return null;
      },
    );
  },
  name: 'routerProvider',
);