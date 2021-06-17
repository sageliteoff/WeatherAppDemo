import 'package:weather_app/features/weather/domain/entities/weatherEntity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(String locationName);
}
