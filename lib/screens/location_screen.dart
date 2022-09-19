import 'package:flutter/material.dart';
import 'package:weather_app_clima/utilities/constants.dart';
import 'package:weather_app_clima/services/weather.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'city_screen.dart';

WeatherModel model = WeatherModel();

class LocationScreen extends StatefulWidget {
  LocationScreen(this.WeatherData);
  final WeatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  var temperature;
  var hTemp;
  var lTemp;
  var cityName;
  var iconId;
  var countryName;
  var wind;
  var humidity;
  var wcond; //weather condition
  var varId;
  String bgname = 'clear';

  void initState() {
    super.initState();

    updateUI(widget.WeatherData);
  }

  void dynamicBackground(String stat) {
    if (stat == 'thunderstorm') {
      bgname = 'thunderstorm';
    } else if (stat == 'drizzle') {
      bgname = 'drizzle';
    } else if (stat == 'rain') {
      bgname = 'rain';
    } else if (stat == 'snow') {
      bgname = 'snow';
    } else if (stat == 'cloudy') {
      bgname = 'clouds';
    } else if (stat == 'windy') {
      bgname = 'windy';
    } else
      bgname = 'clear';
  }

  void updateUI(dynamic Weather) async {
    setState(() {
      var temp;
      if (Weather == null) {
        countryName = 'Error';
        cityName = 'Error';
        temperature = 0;
        hTemp = 0;
        lTemp = 0;
        wind = 0; // m/s
        humidity = 0; // percentage
        wcond = 'Clear';
        iconId = '01d';
        return;
      }

      countryName = Weather['sys']['country'];
      cityName = Weather['name'];
      temp = Weather['main']['temp'];
      temperature = temp.toInt();
      temp = Weather['main']['temp_max'];
      hTemp = temp.toInt();
      temp = Weather['main']['temp_min'];
      lTemp = temp.toInt();
      wind = Weather['wind']['speed']; // m/s
      humidity = Weather['main']['humidity']; // percentage
      wcond = Weather['weather'][0]['main'];
      varId = Weather['weather'][0]['id'];
      iconId = Weather['weather'][0]['icon'];
      String status = model.getWeather(varId);
      dynamicBackground(status);
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/' + bgname + '_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: GlassmorphicContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // width: 350,
            //height: 350,
            borderRadius: 0,
            blur: 5,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        onPressed: () async {
                          var Data = await model.getCurrentWeather();
                          updateUI(Data);
                        },
                        icon: Icon(
                          Icons.near_me,
                        )),
                    IconButton(
                        onPressed: () async {
                          var CityEntered = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CityScreen();
                          }));

                          if (CityEntered != null) {
                            var returnedData =
                                await model.getCityWeather(CityEntered);
                            updateUI(returnedData);
                          } else
                            print('Returned Value was null');
                        },
                        icon: Icon(
                          Icons.location_city,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, top: 55, right: 0, bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(countryName, style: kLightTextStyle),
                      Row(
                        children: <Widget>[
                          Text(cityName,
                              style: kTempTextStyle.copyWith(
                                fontSize: 27,
                              )),
                          Image(
                              image: NetworkImage(
                                  'http://openweathermap.org/img/wn/$iconId.png')),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GlassmorphicContainer(
                        width: 350,
                        height: 200,
                        borderRadius: 20,
                        blur: 20,
                        alignment: Alignment.centerRight,
                        border: 2,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Now", style: kLightTextStyle),
                                Text('$temperature°', style: kTempTextStyle),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'H: $hTemp°',
                                      style: kHiloTempStyle,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('L: $lTemp°', style: kHiloTempStyle),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('Condition:$wcond',
                                        style: kConditionTextStyle),
                                    Text('Wind:$wind m/s',
                                        style: kConditionTextStyle),
                                    Text('Humidity:$humidity %',
                                        style: kConditionTextStyle),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
