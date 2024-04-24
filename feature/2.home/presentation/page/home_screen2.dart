import '../../../../core/constants/index.dart';

class HomeScreen2 extends ConsumerStatefulWidget {
  const HomeScreen2({super.key});

  @override
  ConsumerState<HomeScreen2> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: home(),
      ),
    );
  }

  Widget home() {
    return const Text('home screen2');
  }
}