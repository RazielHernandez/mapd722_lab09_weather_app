import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const weatherAPIKey = "d94f22decde6dd8ec8a8f44dcfa74636";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitud}&appid=$weatherAPIKey&units=metric");
    var locationData = await networkHelper.getData();

    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return LocationScreen(locationData);
    }));
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100.0,
        )
      ),
    );
  }
}
