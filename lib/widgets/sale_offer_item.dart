import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_shop/screens/sale_offer_details_screen.dart';

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
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SaleOfferDetailsScreen(),fullscreenDialog: true)),
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
