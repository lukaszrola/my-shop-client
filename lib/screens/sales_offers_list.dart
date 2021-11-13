import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/utils/graphql_keys.dart';
import 'package:my_shop/widgets/sale_offer_item.dart';

class SalesOffersList extends StatelessWidget {
  const SalesOffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
      ),
      body: Subscription(
          options: SubscriptionOptions(
            document: gql(GraphQLUtil.offersSubscription),
          ),
          builder: (
            QueryResult result, {
            Refetch? refetch,
            FetchMore? fetchMore,
          }) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final offersCount =
                result.data![GraphQLUtil.subscribeSaleOffersKey].length;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Total offers($offersCount)",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, idx) {
                      final offer =
                          result.data![GraphQLUtil.subscribeSaleOffersKey][idx];
                      return SaleOfferItem(
                          key: Key(offer[GraphQLUtil.idKey]),
                          id: offer[GraphQLUtil.idKey],
                          imageUrl: offer[GraphQLUtil.imageUrlKey],
                          name: offer[GraphQLUtil.nameKey],
                          deliveryInDays: offer[GraphQLUtil.deliveryInDaysKey],
                          price: offer[GraphQLUtil.priceInDollarsKey]);
                    },
                    itemCount: offersCount,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
