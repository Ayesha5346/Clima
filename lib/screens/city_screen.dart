import 'package:flutter/material.dart';
import 'package:weather_app_clima/utilities/constants.dart';
import 'package:glassmorphism/glassmorphism.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/homePage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: GlassmorphicContainer(
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
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: null,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    style: TextStyle(
                      color: Color(0xFF474869),
                      fontFamily: 'Dosis-Medium',
                    ),
                    decoration: kTextInputStyleDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text('Get Weather',
                      style: kTempTextStyle.copyWith(
                        fontSize: 40,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
