import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const weatherAPIKey = "d94f22decde6dd8ec8a8f44dcfa74636";
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$weatherAPIKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var locationData = await networkHelper.getData();
    return locationData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper("$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitud}&appid=$weatherAPIKey&units=metric");
    var locationData = await networkHelper.getData();
    return locationData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp,) {
    if (temp > 25) {
      return "It\'s 🍦 time";
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
