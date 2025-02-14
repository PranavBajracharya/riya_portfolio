import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:riya_portfolio/screens/clima/services/networking.dart';

const fakeStoreURI = 'https://fakestoreapi.com/products/1';

class FakeStoreScreen extends StatefulWidget {
  const FakeStoreScreen({
    super.key,
    // this.productTitle,
    // this.productPrice,
    // this.productCategory,
  });

  // final String? productTitle;
  // final String? productPrice;
  // final String? productCategory;

  @override
  State<FakeStoreScreen> createState() => _FakeStoreScreenState();
}

class _FakeStoreScreenState extends State<FakeStoreScreen> {
  String productTitle = "N/A";
  String productPrice = "N/A";
  String productCategory = "N/A";
  // Map<String, dynamic> response = {};

  // Future<dynamic> display() async {
  //   NetworkHelper networkHelper = NetworkHelper(fakeStoreURI);

  //   var productData = await networkHelper.getData();

  //   return productData;
  // }

  Future<dynamic> getData() async {
    http.Response response = await http.get(
      Uri.parse(fakeStoreURI),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      log(
        data,
        name: "response.body",
      );
      var returnData = jsonDecode(data);
      log(
        returnData.toString(),
        name: "returnData",
      );
      productTitle = returnData["title"];
      productPrice = returnData["price"].toString();
      productCategory = returnData["category"];

      setState(() {});
      return returnData;
    } else {
      log(
        response.statusCode.toString(),
        name: "response.statusCode",
      );
    }
  }

//   Future<dynamic> getProductDetail ()async{
// // var productDetail = await data.getData();
// // return productDetail;

//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await getData();
                // productTitle = response["title"];
                // setState(() {});
              },
              child: Text('Get Data'),
            ),
            Text(
              productTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            // Text('productId'),
            // Text('$productTitle'),
            Text("\$$productPrice"),
            Text('\$' + productPrice),
            Text(productCategory),
          ],
        ),
      ),
    );
  }
}
