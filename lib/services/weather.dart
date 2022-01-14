
import '../services/location.dart';
import '../services/networking.dart';

const String apiKey = '0726edb5482148054a73b27921cdcdfd';
const String openWeatherApiKey = 'http://api.openweathermap.org/data/2.5/weather?';

class WeatherModel {

  Future<dynamic> getWeatherByCityname(String cityName)async {

    String url = '${openWeatherApiKey}q=$cityName&units=metric&$apiKey';
    NetworkHelper networkHelper = await NetworkHelper('${openWeatherApiKey}q=$cityName&appid=$apiKey&units=metric');

    var data = await networkHelper.getData();
    return data;

  }

 Future<dynamic> getCurrentLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherApiKey'
        'lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData =  await networkHelper.getData();
    return weatherData;
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
