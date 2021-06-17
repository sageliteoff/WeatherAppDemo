import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/weatherEntity.dart';

class WeatherModel extends WeatherEntity {
  final double temprature;
  final String locationName;
  final Map<String, dynamic> coordinate;
  final String description;
  final String iconUrl;
  final double feelsLike;
  final DateTime dateTime;
  final double maxTemperature;
  final double minTemperature;
  final double humidity;
  final double pressure;

  WeatherModel({
    @required this.locationName,
    @required this.temprature,
    @required this.coordinate,
    @required this.description,
    @required this.dateTime,
    @required this.feelsLike,
    @required this.iconUrl,
    this.maxTemperature,
    this.minTemperature,
    this.humidity,
    this.pressure,
  }) : super(
          locationName: locationName,
          temprature: temprature,
          coordinate: coordinate,
          iconUrl: iconUrl,
          dateTime: dateTime,
          feelsLike: feelsLike,
          description: description,
          minTemperature: minTemperature,
          maxTemperature: maxTemperature,
          humidity: humidity,
          pressure: pressure,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      locationName: json["name"],
      temprature: json["main"]["temp"],
      coordinate: json["coord"],
      dateTime: DateTime.now(),
      description: json["weather"][0]["description"],
      iconUrl:
          "https://openweathermap.org/img/wn/${json["weather"][0]["icon"]}@2x.png",
      feelsLike: json["main"]["feels_like"],
      maxTemperature: json["main"]["temp_max"],
      minTemperature: json["main"]["temp_min"],
      // pressure: json["main"]["pressure"],
      // humidity: json["main"]["humidity"],
    );
  }
}
