import 'package:flutter/material.dart';
import 'package:riya_portfolio/screens/clima/screens/location_screen.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:riya_portfolio/screens/clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

   
    var weatherData = await WeatherModel().getLocationWeather();
    
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitDoubleBounce(
        color: Colors.black,
        size: 100.0,
      ),
    ));
  }
}
//   void getLocation() async{

//     final LocationSettings locationSettings = LocationSettings(
//   accuracy: LocationAccuracy.low,
//   distanceFilter: 100,
// );

//     Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
//     print(position);

//   }

 

