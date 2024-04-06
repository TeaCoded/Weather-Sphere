import 'package:weather_sphere/data/model/current_weather_data.dart';
import 'package:weather_sphere/data/model/hourly_weather_data.dart';
import 'package:weather_sphere/data/model/daily_weather_data.dart';
import 'package:weather_sphere/data/model/weather_data.dart';
import 'package:weather_sphere/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchWeatherAPI {
  WeatherData? weatherData;
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(
      weatherUrl(lat, lon),
    ));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      CurrentWeatherData.fromJson(jsonString),
      HourlyWeatherData.fromJson(jsonString),
      DailyWeatherData.fromJson(jsonString),
    );

    return weatherData!;
  }
}
