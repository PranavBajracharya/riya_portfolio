import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    //make the API call
    http.Response respond = await http.get(Uri.parse(
        url));
    if (respond.statusCode == 200) {
      String data = respond.body;
      // print(data);

     return jsonDecode(data);

      

  }
  else {
      print(respond.statusCode);
    } 
}
}