import 'package:flutter/material.dart';

const kTempTextStyle =  TextStyle(
fontFamily: 'Dosis-Bold',
fontSize: 90,
fontWeight: FontWeight.w800,
color: Color(0xFF372B31),
);

const kHiloTempStyle =TextStyle(
  fontSize: 12,
  fontFamily: 'Dosis-Bold',
  color: Color(0xFF474869),
);
const kLightTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  fontFamily: 'Dosis',
  color: Color(0xFF474869),
);


const kConditionTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: 'Dosis-Bold',
  color: Color(0xFF474869),
);

final kTextInputStyleDecoration= InputDecoration(
  fillColor: Colors.white70,
  filled: true,
  icon: Icon(Icons.location_city, color: Colors.white70, size: 30,),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Color(0xFF474869),),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide.none,
  ),
  isDense: true,
);