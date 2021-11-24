class GraphQLUtil {
  static const offer = "offer";
  static const offers = "offers";
  static const subscribeOffers = "offers";
  static const id = "id";
  static const name = "name";
  static const imageUrl = "imageUrl";
  static const deliveryInDays = "deliveryInDays";
  static const priceInDollars = "priceInDollars";
  static const seller = "seller";
  static const sellerName = "name";
  static const specification = "specification";
  static const componentName = "name";
  static const componentConfiguration = "configuration";
  static const additionalInfo = "additionalInfo";
  static const removeOffer = "removeOffer";

  static const findOfferByIdQuery = """
      query $offer(\$id: ID!){
        $offer(id: \$id) {
          $name
          $deliveryInDays
          $priceInDollars
          $imageUrl
          $specification{
            $componentName
            $componentConfiguration
          }
          $seller{
            $sellerName
          }
          $additionalInfo
        }
      }
      """;

  static const offersSubscription = """
      subscription {
        $subscribeOffers {
          $id,
          $name,
          $deliveryInDays,
          $priceInDollars,
          $imageUrl
        }
      }
      """;

  static const removeOfferMutation = """
      mutation $removeOffer(\$id: ID!) {
        $removeOffer(id:\$id) {
          $id
        }
      }
  """;
}