import 'package:flutter/widgets.dart';
import 'package:my_shop/widgets/section_title.dart';

class OfferAdditionalInfoWidget extends StatelessWidget {
  final String additionalInfo;
  const OfferAdditionalInfoWidget(this.additionalInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle("Additional info"),
        const SizedBox(
          height: 5,
        ),
        Text(
          additionalInfo,
          style: const TextStyle(fontSize: 17),
        )
      ],
    );
  }
}
