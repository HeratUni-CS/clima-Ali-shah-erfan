import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  State <StatefulWidget>createState(){
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocationData();
    print('this line of code is triggered');
   
  }

  void getLocationData () async{
   var weatherData =await WeatherModel().getLocationWeather();

     Navigator.push(context, Material(PageRoute(builder: (context){
          return LocationScreen(locationWeather: WeatherData,);
     })));
     
    var longitude = jsonDecode(data)['coord']['lon'];

    var weatherDescription = jsonDecode(data)['Weather'][0]['description'];
      print(weatherDescription);
  }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: spinkitDoubleBounce(
          color: Colors.white,
           size: 100,
        ),
      ),
        
      
    );
  }
