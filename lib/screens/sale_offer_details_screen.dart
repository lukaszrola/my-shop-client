import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_shop/widgets/buy_button.dart';
import 'package:my_shop/widgets/offer.description/offer_description_widget.dart';
import 'package:my_shop/widgets/product_image_widget.dart';

class SaleOfferDetailsScreen extends StatelessWidget {
  const SaleOfferDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offer details"),
      ),
      bottomNavigationBar: const BuyButton(3000),
      body: Flex(
        direction: Axis.vertical,
        children: const [
          Flexible(
            flex: 2,
            child: ProductImageWidget(
              "https://images.unsplash.com/photo-1569770218135-bea267ed7e84?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=880&q=80",
            ),
          ),
          Flexible(
            flex: 3,
            child: OfferDescriptionWidget(
              productName: "MacBook Pro 2019",
              deliveryInDays: 3,
              sellerName: "John Smith",
              specification: {
                "Processor:": "Intel Core i7-11700K",
                "Memory": "16 GB",
                "Graphic card": "AMD Radeon Pro 5500M",
                "Hard drive": "1000GB SSD"
              },
              additionalInfo:
                  "Incredibly light and boasting a speedy performance, get your work done anywhere with the MacBook Air (2020).",
            ),
          ),
        ],
      ),
    );
  }
}
