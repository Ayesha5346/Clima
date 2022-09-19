import 'package:flutter/material.dart';
import 'package:weather_app_clima/screens/location_screen.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app_clima/utilities/constants.dart';
import 'package:weather_app_clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    WeatherModel weather = WeatherModel();
    var data = await weather.getCurrentWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(data);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/homePage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GlassmorphicContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            borderRadius: 0,
            blur: 03,
            alignment: Alignment.bottomCenter,
            border: 0,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.1),
                  Color(0xFFFFFFFF).withOpacity(0.05),
                ],
                stops: [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.5),
                Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Welcome to Clima',
                    style: kHiloTempStyle.copyWith(
                      fontSize: 30,
                    )),
                SpinKitFadingCircle(
                  color: Colors.black12,
                  size: 100.0,
                ),
              ],
            )),
      ),
    );
  }
}
