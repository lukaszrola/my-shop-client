import 'package:flutter/widgets.dart';

import 'description_item.dart';
import 'section_title.dart';

class OfferSpecificationWidget extends StatelessWidget {
  final Map<String, String> specificationItems;

  const OfferSpecificationWidget({Key? key, required this.specificationItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle("Product specification"),
        const SizedBox(
          height: 5,
        ),
        ...specificationItems.entries
            .map(
              (entry) => DescriptionItem(
                  descriptionName: entry.key, descriptionValue: entry.value),
            )
            .toList()
      ],
    );
  }
}
