import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SaleOfferItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int deliveryInDays;
  final int price;

  const SaleOfferItem(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.deliveryInDays,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepOrange.shade100,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name),
        subtitle: Text("Delivery in $deliveryInDays days"),
        trailing: Text(
          "$price\$",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
