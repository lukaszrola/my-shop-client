import 'package:flutter/widgets.dart';

import 'offer_additional_info_widget.dart';
import 'offer_basic_information_widget.dart';
import 'offer_specification_widget.dart';

class OfferDescriptionWidget extends StatelessWidget {
  final String productName;
  final int deliveryInDays;
  final String sellerName;
  final Map<String, String> specification;
  final String additionalInfo;

  const OfferDescriptionWidget(
      {Key? key,
      required this.productName,
      required this.deliveryInDays,
      required this.sellerName,
      required this.specification,
      required this.additionalInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            OfferBasicInformationWidget(
                productName: productName,
                deliveryInDays: deliveryInDays,
                sellerName: sellerName),
            const SizedBox(
              height: 5,
            ),
            OfferSpecificationWidget(specificationItems: specification),
            const SizedBox(
              height: 5,
            ),
            OfferAdditionalInfoWidget(additionalInfo),
          ],
        ),
      ),
    );
  }
}
