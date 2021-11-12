import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/widgets/sale_offer_item.dart';

class SalesOffersList extends StatelessWidget {
  static const findSaleOffers = """
      query findSaleOffers{
        findSaleOffers {
          name,
          deliveryInDays,
          priceInDollars,
          imageUrl
        }
      }
      """;

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

  static const findSaleOffersKey = "findSaleOffers";
  static const subscribeSaleOffersKey = "subscribeNewOffers";
  static const idKey = "id";
  static const nameKey = "name";
  static const imageUrlKey = "imageUrl";
  static const deliveryInDaysKey = "deliveryInDays";
  static const priceInDollarsKey = "priceInDollars";

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
            final offer = result.data![subscribeSaleOffersKey][idx];
            return SaleOfferItem(
                key: Key(offer[idKey]),
                imageUrl: offer[imageUrlKey],
                name: offer[nameKey],
                deliveryInDays: offer[deliveryInDaysKey],
                price: offer[priceInDollarsKey]);
          },
            itemCount: result.data![subscribeSaleOffersKey].length,
          );
        });
  }
}
