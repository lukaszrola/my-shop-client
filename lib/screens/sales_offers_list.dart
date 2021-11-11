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
            return const Text('Loading');
          }

          return ResultAccumulator.appendUniqueEntries(
              latest: result.data,
              builder: (context, {dynamic results}) {
                return ListView.builder(itemBuilder: (ctx, index) {
                  final offer = results[index][subscribeSaleOffersKey];
                  return SaleOfferItem(
                      key: Key(offer["id"]),
                      imageUrl: offer[imageUrlKey],
                      name: offer[nameKey],
                      deliveryInDays: offer[deliveryInDaysKey],
                      price: offer[priceInDollarsKey]);
                },
                  itemCount: results.length,

                );
              });
        });
  }
}
