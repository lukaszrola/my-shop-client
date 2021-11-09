import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/widgets/sale_offer_item.dart';

class SalesOffersList extends StatelessWidget {
  static const  findSaleOffers = """
      query findSaleOffers{
        findSaleOffers {
          name,
          deliveryInDays,
          priceInDollars,
          imageUrl
        }
      }
      """;

  static const findSaleOffersKey = "findSaleOffers";
  static const nameKey = "name";
  static const imageUrlKey = "imageUrl";
  static const deliveryInDaysKey = "deliveryInDays";
  static const priceInDollarsKey = "priceInDollars";

  const SalesOffersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Query(
      options: QueryOptions(
        document: gql(findSaleOffers),
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

        List saleOffers = result.data![findSaleOffersKey];

        return ListView.builder(
            itemCount: saleOffers.length,
            itemBuilder: (context, index) {
              final saleOfferItem = saleOffers[index];
              return SaleOfferItem(
                  name: saleOfferItem[nameKey],
                  imageUrl: saleOfferItem[imageUrlKey],
                  deliveryInDays: saleOfferItem[deliveryInDaysKey],
                  price: saleOfferItem[priceInDollarsKey]);
            });
      },
    );
  }
}
