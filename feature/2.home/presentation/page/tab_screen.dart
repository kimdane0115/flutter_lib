
import '../../../../core/constants/index.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int get currentIndex {
    final GoRouterState route = GoRouterState.of(context);
    final String location = route.fullPath.toString();

    if (location == const HomeScreenRoute().location) {
      return 0;
    } else if (location == const HomeScreenRoute2().location) {
      return 1;
    } else if (location == const HomeScreenRoute3().location) {
      return 2;
    } else {
      return 0; // Default index if no match
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(index, ref, context),
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      // selectedItemColor: context.theme.colorScheme.primary,
      // unselectedItemColor: context.theme.colorScheme.outlineVariant,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_snippet),
          label: '텍스트',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: '정보',
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomIcon(IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        size: 24,
      ),
      label: '',
    );
  }

  void _onItemTapped(int index, WidgetRef ref, BuildContext context) async {
    // currentIndex = index;
    switch (index) {
      case 0:
        const HomeScreenRoute().go(context);
        break;
      case 1:
        const HomeScreenRoute2().go(context);
        break;
      case 2:
        const HomeScreenRoute3().go(context);
        break;
    }
  }

}