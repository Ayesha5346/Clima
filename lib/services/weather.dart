import 'package:weather_app_clima/services/location.dart';
import 'package:weather_app_clima/services/networking.dart';

class WeatherModel {
  double latitude = 0, longitude = 0;

  Future getCityWeather(String name) async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=' +
        name +
        '&appid=a400220092e9f7065e0588b4a51c21f4&units=metric';
    networkHelper weather = networkHelper(Uri.parse(url));
    var data = await weather.getData();
    return data;
  }

  Future getCurrentWeather() async {
    Location location = Location();
    await location.getLocation();
    latitude = location.lat;
    longitude = location.long;

    networkHelper weather = networkHelper(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a400220092e9f7065e0588b4a51c21f4&units=metric'));
    var data = await weather.getData();
    return data;
  }

  String getWeather(int temp) {
    if (temp >= 200 && temp <= 232) {
      return 'thunderstorm';
    }
    if (temp >= 300 && temp <= 321) {
      return 'drizzle';
    }
    if (temp >= 500 && temp <= 531) {
      return 'rain';
    }
    if (temp >= 600 && temp <= 622) {
      return 'snow';
    }
    if (temp == 800) {
      return 'clear';
    }
    if (temp >= 801 && temp <= 804) {
      return 'cloudy';
    } else {
      return 'windy';
    }
  }
}
