import 'collapsing_appbarwith_tabs_page.dart';

import '../../../../core/constants/index.dart';

class HomeScreen3 extends ConsumerStatefulWidget {
  const HomeScreen3({super.key});

  @override
  ConsumerState<HomeScreen3> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CollapsingAppbarWithTabsPage(),
      ),
    );
  }

  Widget home() {
    return const Text('home screen3');
  }
}