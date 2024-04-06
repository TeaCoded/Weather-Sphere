import 'package:weather_sphere/data/model/current_weather_data.dart';
import 'package:weather_sphere/data/model/hourly_weather_data.dart';
import 'package:weather_sphere/data/model/daily_weather_data.dart';

class WeatherData {
  final CurrentWeatherData? current;
  final HourlyWeatherData? hourly;
  final DailyWeatherData? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  CurrentWeatherData getCurrentWeather() => current!;
  HourlyWeatherData getHourlyWeather() => hourly!;
  DailyWeatherData getDailyWeather() => daily!;
}
