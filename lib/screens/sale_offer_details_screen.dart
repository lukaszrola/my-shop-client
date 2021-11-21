import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/utils/graphql_keys.dart';
import 'package:my_shop/widgets/buy_button.dart';
import 'package:my_shop/widgets/offer.description/offer_description_widget.dart';
import 'package:my_shop/widgets/product_image_widget.dart';

class SaleOfferDetailsScreen extends StatelessWidget {
  final String offerId;

  const SaleOfferDetailsScreen(this.offerId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: gql(GraphQLUtil.findOfferByIdQuery),
          variables: {"id": offerId}),
      builder: (QueryResult result, {Refetch? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          log("error has occurred ${result.exception}");
          return const Center(child: CircularProgressIndicator());
        }

        if (result.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final offer = result.data![GraphQLUtil.offerKey];

        return Scaffold(
          appBar: AppBar(
            title: const Text("Offer details"),
          ),
          bottomNavigationBar: BuyButton(
              offerId: offerId,
              priceInDollars: offer[GraphQLUtil.priceInDollarsKey]),
          body: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                flex: 2,
                child: ProductImageWidget(
                  offer[GraphQLUtil.imageUrlKey],
                ),
              ),
              Flexible(
                flex: 3,
                child: OfferDescriptionWidget(
                    productName: offer[GraphQLUtil.nameKey],
                    deliveryInDays: offer[GraphQLUtil.deliveryInDaysKey],
                    sellerName: offer[GraphQLUtil.sellerKey]
                        [GraphQLUtil.sellerNameKey],
                    specification: {
                      for (final e in offer[GraphQLUtil.specificationKey])
                        e[GraphQLUtil.componentNameKey]:
                            e[GraphQLUtil.componentConfigurationKey]
                    },
                    additionalInfo: offer[GraphQLUtil.additionalInfoKey]),
              ),
            ],
          ),
        );
      },
    );
  }
}
