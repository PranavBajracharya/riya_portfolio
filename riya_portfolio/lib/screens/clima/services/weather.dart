import 'package:riya_portfolio/screens/clima/services/location.dart';
import 'package:riya_portfolio/screens/clima/services/networking.dart';

const apiKey = '31916f53e65eb764fdaaab8464f53661';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  } 


Future<dynamic> getLocationWeather() async {
  Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    
    return weatherData;

}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '⛈️';
    } else if (condition < 400) {
      return '🌦️';
    } else if (condition < 600) {
      return '☂️';
    }else if (condition < 700) {
      return '⛄';
    } else if (condition < 800) {
      return '⚡';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🙅‍♂️';
    }
  }

  String getMessage (double temp) {
    if ( temp > 25){
      return 'It\'s 🍦 time';
    } else if (temp>20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'you\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}