import 'package:clima/Services/Location.dart';
import 'package:clima/Services/networking.dart';

const apiKey = 'e72ca729af22beabd5d20e3b7749713';
const openWeatherMapURL ='https://api.openweathermap.org/data/2.5weather';
class WeatherModel {

   Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q = $cityName&appid=$apiKey&units = metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
   }
  Future<dynamic> getLocationWeather() async{
     Location location = Location();
   await location.getCurrentLocation();
   NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?lat = ${Location.latitude}&lon = ${Location.longitude}&appid=$apiKey&units = metric');
    var WeatherData = await NetworkHelper.getData();
      return WeatherData; 
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
