import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/utils/graphql_keys.dart';
import 'package:my_shop/widgets/sale_offer_item.dart';

class SalesOffersList extends StatelessWidget {
  static const subscribeNewOffers = """
      subscription {
        subscribeNewOffers {
          id,
          name,
          deliveryInDays,
          priceInDollars,
          imageUrl
        }
      }
      """;

  const SalesOffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Subscription(
        options: SubscriptionOptions(
          document: gql(subscribeNewOffers),
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
            final offer = result.data![GraphQLKeys.subscribeSaleOffersKey][idx];
            return SaleOfferItem(
                key: Key(offer[GraphQLKeys.idKey]),
                id: offer[GraphQLKeys.idKey],
                imageUrl: offer[GraphQLKeys.imageUrlKey],
                name: offer[GraphQLKeys.nameKey],
                deliveryInDays: offer[GraphQLKeys.deliveryInDaysKey],
                price: offer[GraphQLKeys.priceInDollarsKey]);
          },
            itemCount: result.data![GraphQLKeys.subscribeSaleOffersKey].length,
          );
        });
  }
}
