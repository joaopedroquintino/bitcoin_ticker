import 'package:bitcoin_ticker/features/bitcoin_ticker/presentation/pages/bitcoin_ticker_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BitcoinTickerHomePage(),
    );
  }
}
