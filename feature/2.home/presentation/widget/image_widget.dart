import '../../../../core/constants/index.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    // return Container();
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}