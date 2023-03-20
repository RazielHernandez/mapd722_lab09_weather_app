import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocatoin() async {

    Location location = Location();
    await location.getCurrentPosition();
    print("latitude: ${location.latitude}");
    print("longitud: ${location.longitud}");
  }

  @override
  void initState() {
    getLocatoin();
    super.initState();
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
