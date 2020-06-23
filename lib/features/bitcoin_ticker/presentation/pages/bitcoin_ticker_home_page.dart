import 'dart:io' show Platform;

import 'package:bitcoin_ticker/features/bitcoin_ticker/presentation/utils/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BitcoinTickerHomePage extends StatefulWidget {
  @override
  _BitcoinTickerHomePageState createState() => _BitcoinTickerHomePageState();
}

class _BitcoinTickerHomePageState extends State<BitcoinTickerHomePage> {
  var selectedCurrency = 'BRL';
  final currenciesList = CoinData.currencies;

  DropdownButton getDropDownButton() {
    return DropdownButton(
      value: selectedCurrency,
      items: getDropdownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    return CupertinoPicker(
      diameterRatio: 1.5,
      looping: true,
      itemExtent: 42,
      onSelectedItemChanged: (selectedItemIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedItemIndex];
        });
      },
      children: getPickerItems(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bitcoin Ticker'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Card(
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CupertinoButton(
                              padding: EdgeInsets.all(10),
                              color: Theme.of(context).cursorColor,
                              child: Text('crypto'),
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.compare_arrows),
                          ),
                          Expanded(
                            child: CupertinoButton(
                              padding: EdgeInsets.all(10),
                              color: Theme.of(context).cursorColor,
                              child: Text(selectedCurrency),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 150,
                color: Theme.of(context).cursorColor,
                alignment: Alignment.center,
                child: Platform.isAndroid
                    ? getDropDownButton()
                    : getCupertinoPicker(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropItems = [];
    for (var currency in currenciesList) {
      dropItems.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return dropItems;
  }

  List<Text> getPickerItems() {
    List<Text> pickerItems = [];
    for (var currency in currenciesList) {
      pickerItems.add(
        Text(
          currency,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return pickerItems;
  }
}
