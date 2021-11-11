import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:my_shop/screens/sales_offers_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final link = HttpLink("http://192.168.1.2:8080/graphql");
  static final subscriptionLink = WebSocketLink(
    "ws://192.168.1.2:8080/subscriptions",
    config: const SocketClientConfig(
      inactivityTimeout: Duration(seconds: 300),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(
        GraphQLClient(
            link: Link.split(
                (request) => request.isSubscription, subscriptionLink, link),
            cache: GraphQLCache()),

      ),
      child: MaterialApp(
        title: 'AwesomeShop',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const MyHomePage(title: 'AwesomeShop'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.deepOrange.shade50,
          child: const SalesOffersList(),
        ));
  }
}
