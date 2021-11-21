class GraphQLUtil {
  static const offerKey = "offer";
  static const offersKey = "offers";
  static const subscribeOffersKey = "offers";
  static const idKey = "id";
  static const nameKey = "name";
  static const imageUrlKey = "imageUrl";
  static const deliveryInDaysKey = "deliveryInDays";
  static const priceInDollarsKey = "priceInDollars";
  static const sellerKey = "seller";
  static const sellerNameKey = "name";
  static const specificationKey = "specification";
  static const componentNameKey = "name";
  static const componentConfigurationKey = "configuration";
  static const additionalInfoKey = "additionalInfo";
  static const removeOfferKey = "removeOffer";

  static const findOfferByIdQuery = """
      query $offerKey(\$id: ID!){
        $offerKey(id: \$id) {
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
        $subscribeOffersKey {
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