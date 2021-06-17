import 'package:flutter/cupertino.dart';
import 'package:weather_app/features/weather/domain/entities/weatherEntity.dart';
import 'package:weather_app/features/weather/domain/repositories/weatherRepository.dart';

class GetWeatherUseCase {
  WeatherRepository repository;
  GetWeatherUseCase({@required this.repository});

  Future<WeatherEntity> getWeather(String locationName) {
    return repository.getWeather(locationName);
  }
}
