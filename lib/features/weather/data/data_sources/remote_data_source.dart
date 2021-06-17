import 'package:weather_app/core/api_helper.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';

WeatherModel dummyModel = WeatherModel(
    locationName: "Failed",
    temprature: 37,
    coordinate: {"lon": "0.0", "lat": "0.0"},
    iconUrl: "http://openweathermap.org/img/wn/10d@2x.png",
    description: "unknown",
    maxTemperature: 0,
    minTemperature: 0,
    feelsLike: 33,
    dateTime: DateTime.now(),
    pressure: 0,
    humidity: 0);

class WeatherApi extends ApiBaseHelper {
  Future<WeatherModel> getWeather(String url) async {
    Map<String, dynamic> jsonResponse = await this.get(url);

    return WeatherModel.fromJson(
      jsonResponse,
    );
  }
}
