import 'package:flutter/widgets.dart';

class DescriptionItem extends StatelessWidget {
  final String descriptionName;
  final String descriptionValue;

  const DescriptionItem({Key? key, required this.descriptionName, required this.descriptionValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(descriptionName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
        Text(descriptionValue, style: const TextStyle(fontSize: 17),),
      ],
    );
  }
}
