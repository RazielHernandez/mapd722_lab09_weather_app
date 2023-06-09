import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    //http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$weatherAPIKey"));
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print("API error with code: ${response.statusCode}");
    }
  }

}