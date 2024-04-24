import 'config/routers/router_provider.async_notifier.dart';
import 'core/constants/index.dart';
import 'flavors.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return MaterialApp(
    //   title: F.title,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: _flavorBanner(
    //     child: MyHomePage(),
    //     show: kDebugMode,
    //   ),
    // );
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        Widget actualChild = _flavorBanner(
          child: child!,
          show: F.appFlavor != Flavor.prod ? true : false,
        );
        return MediaQuery.withClampedTextScaling(
          maxScaleFactor: 1.0,
          minScaleFactor: 1.0,
          child: actualChild,
        );
      },
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0,
                  letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}