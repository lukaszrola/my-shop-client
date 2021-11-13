import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/utils/graphql_keys.dart';
import 'package:my_shop/widgets/sale_offer_item.dart';

class SalesOffersList extends StatelessWidget {

  const SalesOffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Subscription(
        options: SubscriptionOptions(
          document: gql(GraphQLUtil.offersSubscription),
          fetchPolicy: FetchPolicy.cacheAndNetwork
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

          return ListView.builder(itemBuilder: (ctx, idx) {
            final offer = result.data![GraphQLUtil.subscribeSaleOffersKey][idx];
            return SaleOfferItem(
                key: Key(offer[GraphQLUtil.idKey]),
                id: offer[GraphQLUtil.idKey],
                imageUrl: offer[GraphQLUtil.imageUrlKey],
                name: offer[GraphQLUtil.nameKey],
                deliveryInDays: offer[GraphQLUtil.deliveryInDaysKey],
                price: offer[GraphQLUtil.priceInDollarsKey]);
          },
            itemCount: result.data![GraphQLUtil.subscribeSaleOffersKey].length,
          );
        });
  }
}
