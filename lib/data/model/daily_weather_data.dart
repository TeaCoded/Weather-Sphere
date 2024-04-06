class DailyWeatherData {
  List<Daily> daily;

  DailyWeatherData({required this.daily});

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) =>
      DailyWeatherData(
          daily: List<Daily>.from(json["daily"].map((e) => Daily.fromJson(e))));
}

class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  Temp? temp;
  int? humidity;
  double? windSpeed;
  List<Weather>? weather;
  int? clouds;
  double? uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.humidity,
    this.windSpeed,
    this.weather,
    this.clouds,
    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json['dt'] as int?,
        sunrise: json['sunrise'] as int?,
        sunset: json['sunset'] as int?,
        temp: json['temp'] == null
            ? null
            : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        humidity: json['humidity'] as int?,
        windSpeed: (json['wind_speed'] as num?)?.toDouble(),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: json['clouds'] as int?,
        uvi: (json['uvi'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'sunrise': sunrise,
        'sunset': sunset,
        'temp': temp?.toJson(),
        'humidity': humidity,
        'wind_speed': windSpeed,
        'weather': weather?.map((e) => e.toJson()).toList(),
        'clouds': clouds,
        'uvi': uvi,
      };
}

class Temp {
  double? min;
  double? max;

  Temp({
    this.min,
    this.max,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        min: (json['min'] as num?)?.toDouble(),
        max: (json['max'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
