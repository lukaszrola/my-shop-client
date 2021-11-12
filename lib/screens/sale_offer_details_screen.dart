import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_shop/widgets/description_item.dart';

class SaleOfferDetailsScreen extends StatelessWidget {
  const SaleOfferDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order"),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(50, 60)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add_shopping_cart),
            Text(
              "Buy (3200\$)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 2,
            child: Image.network(
              "https://images.unsplash.com/photo-1569770218135-bea267ed7e84?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=880&q=80",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Flexible(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text(
                        "Basic information",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DescriptionItem(
                          descriptionName: "Product name:",
                          descriptionValue: "MacBook Pro 2019"),
                      DescriptionItem(
                          descriptionName: "Delivery in:",
                          descriptionValue: "3 days"),
                      DescriptionItem(
                          descriptionName: "Seller name:",
                          descriptionValue: "John Smith"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Product specification",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DescriptionItem(
                          descriptionName: "Processor:",
                          descriptionValue: "Intel Core i7-11700K"),
                      DescriptionItem(
                          descriptionName: "Memory", descriptionValue: "16 GB"),
                      DescriptionItem(
                          descriptionName: "Graphic card",
                          descriptionValue: "AMD Radeon Pro 5500M"),
                      DescriptionItem(
                          descriptionName: "Hard drive",
                          descriptionValue: "1000GB SSD"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Additional info",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Incredibly light and boasting a speedy performance, get your work done anywhere with the MacBook Air (2020).",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
