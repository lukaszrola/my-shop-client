class GraphQLUtil {
  static const findSaleOffersKey = "findSaleOffers";
  static const subscribeSaleOffersKey = "subscribeNewOffers";
  static const idKey = "id";
  static const nameKey = "name";
  static const imageUrlKey = "imageUrl";
  static const deliveryInDaysKey = "deliveryInDays";
  static const priceInDollarsKey = "priceInDollars";
  static const sellerKey = "seller";
  static const sellerNameKey = "name";
  static const findOfferByIdKey = "findOfferById";
  static const specificationKey = "specification";
  static const componentNameKey = "name";
  static const componentConfigurationKey = "configuration";
  static const additionalInfoKey = "additionalInfo";
  static const removeOfferKey = "removeSaleOffer";

  static const findOfferByIdQuery = """
      query $findOfferByIdKey(\$id: ID!){
        $findOfferByIdKey(id: \$id) {
          $nameKey
          $deliveryInDaysKey
          $priceInDollarsKey
          $imageUrlKey
          $specificationKey{
            $componentNameKey
            $componentConfigurationKey
          }
          $sellerKey{
            $sellerNameKey
          }
          $additionalInfoKey
        }
      }
      """;

  static const offersSubscription = """
      subscription {
        $subscribeSaleOffersKey {
          $idKey,
          $nameKey,
          $deliveryInDaysKey,
          $priceInDollarsKey,
          $imageUrlKey
        }
      }
      """;

  static const removeOfferMutation = """
      mutation $removeOfferKey(\$id: ID!) {
        $removeOfferKey(id:\$id) {
          $idKey
        }
      }
  """;
}