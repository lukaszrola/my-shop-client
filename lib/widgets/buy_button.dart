import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuyButton extends StatelessWidget {
  final int priceInDollars;
  const BuyButton(this.priceInDollars, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: const Size(50, 60)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Icon(Icons.add_shopping_cart),
          Text(
            "Buy ($priceInDollars\$)",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
