import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:riya_portfolio/screens/bitcoin_ticker/coin_data.dart';

String selectedCurrency = 'USD';

String exchangeFrom = "";
String exchangeTo = "";
String rate = "?";

//All Data Api
// https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC?apikey=5eb478e8-0476-4329-bdf1-f3566fdac633

const apikey = '5eb478e8-0476-4329-bdf1-f3566fdac633';

const priceURI =
    'https://api-realtime.exrates.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apikey';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  // String exchangeFrom = "";
  // String exchangeTo = "";
  // String rate = "?";

  Future<dynamic> getApiData() async {
    http.Response response = await http.get(Uri.parse(priceURI));
    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      log(data, name: 'data');

      // exchangeFrom = data['asset_id_base'];
      // exchangeTo = data['asset_id_quote'].toString();
      // rate = data['rate'].toString();

      var returnData = jsonDecode(data);
      // // ignore: dead_code
      // log(returnData, name: 'returndata');
      log(returnData.toString(), name: 'returndata');

      exchangeFrom = returnData['asset_id_base'];
      exchangeTo = returnData['asset_id_quote'];
      //to roundoff
      rate = returnData['rate'].toStringAsFixed(3);

      setState(() {});
      return returnData;
    } else {
      print(response.statusCode);
    }
  }

  // String selectedCurrency = 'USD';

  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      // for (int i = 0; i < currenciesList.length; i++) {
      //   String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value!;
          });
        });
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  // Widget getPicker() {
  //   if (Platform.isIOS) {
  //     return iOSPicker();
  //   } else if (Platform.isAndroid) {
  //     return androidDropdownButton();
  //   }
  //   return getPicker();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.8, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $rate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     await getApiData();
                //   },
                //   child: Text('Get price'),
                // ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.8, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $rate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     await getApiData();
                //   },
                //   child: Text('Get price'),
                // ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.8, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $rate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     await getApiData();
                //   },
                //   child: Text('Get price'),
                // ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await getApiData();
            },
            child: Text('Get price'),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdownButton(),
            // child: CupertinoPicker(
            //     itemExtent: 32.0,
            //     onSelectedItemChanged: (selectedIndex) {
            //       print(selectedIndex);
            //     },
            //     children: getPickerItems(),
            //     ),
            // child: DropdownButton<String>(
            //     value: selectedCurrency,
            //     items:
            //         // [
            //         getDropdownItems(),
            //     // DropdownMenuItem(
            //     //   child: Text('USD'),
            //     //   value: 'USD',
            //     // ),
            //     // DropdownMenuItem(
            //     //   child: Text('EUR'),
            //     //   value: 'EUR',
            //     // ),
            //     // DropdownMenuItem(
            //     //   child: Text('GBP'),
            //     //   value: 'GBP',
            //     // ),
            //     // ],
            //     onChanged: (value) {
            //       setState(() {
            //         selectedCurrency = value!;
            //       });
            //     }),
          ),
        ],
      ),
    );
  }
}
