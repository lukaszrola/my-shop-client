import 'package:flutter/widgets.dart';

import 'description_item.dart';
import 'section_title.dart';

class OfferBasicInformationWidget extends StatelessWidget {
  final String productName;
  final int deliveryInDays;
  final String sellerName;

  const OfferBasicInformationWidget({Key? key, required this.productName, required this.deliveryInDays, required this.sellerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Basic Information"),
        const SizedBox(
          height: 5,
        ),
        DescriptionItem(
            descriptionName: "Product name:",
            descriptionValue: productName),
        DescriptionItem(
            descriptionName: "Delivery in:",
            descriptionValue: "$deliveryInDays days"),
        DescriptionItem(
            descriptionName: "Seller name:",
            descriptionValue: sellerName),
      ],
    );
  }
}
