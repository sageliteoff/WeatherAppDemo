import 'package:weather_app/core/endpoint.dart';
import 'package:weather_app/features/weather/data/data_sources/remote_data_source.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/domain/repositories/weatherRepository.dart';

class ConcreteWeatherRepository extends WeatherRepository {
  final WeatherApi weatherApi = new WeatherApi();

  Future<WeatherModel> getWeather(String locationName) {
    return weatherApi.getWeather(getWeatherByCityNameEndpoint(locationName));
  }
}
