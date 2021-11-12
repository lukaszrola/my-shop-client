import 'package:flutter/widgets.dart';

class ProductImageWidget extends StatelessWidget {
  final String imageUrl;
  const ProductImageWidget(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
