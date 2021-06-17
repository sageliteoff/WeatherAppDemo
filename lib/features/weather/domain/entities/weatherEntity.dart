import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class WeatherEntity {
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

  WeatherEntity({
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
  });
}
