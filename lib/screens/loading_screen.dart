import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocatoin();
    super.initState();
  }
  void getLocatoin() async {
    Location location = Location();
    await location.getCurrentPosition();
    getData();
    print("latitude: ${location.latitude}");
    print("longitud: ${location.longitud}");
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=d94f22decde6dd8ec8a8f44dcfa74636"));
    if (response.statusCode == 200){
      print(response.body);
    } else {
      print("API error with code: ${response.statusCode}");
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //getLocatoin();
          },
          child: Text('Get Location'),
        ),
        /*
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),*/
      ),
    );
  }
}
