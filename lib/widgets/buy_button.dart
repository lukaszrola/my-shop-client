import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/utils/graphql_keys.dart';

class BuyButton extends StatelessWidget {
  final String offerId;
  final int priceInDollars;

  const BuyButton(
      {Key? key, required this.offerId, required this.priceInDollars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLConsumer(
      builder: (GraphQLClient client) => ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size(50, 60)),
        onPressed: () {
          client.mutate(MutationOptions(
              document: gql(GraphQLUtil.removeOfferMutation),
              variables: {"id": offerId}));

          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_shopping_cart),
            Text(
              "Buy ($priceInDollars\$)",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
