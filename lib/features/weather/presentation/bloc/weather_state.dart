part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  final WeatherEntity weather;

  WeatherState({@required this.weather});
}

class WeatherInitial extends WeatherState {
  final WeatherEntity weather = WeatherEntity(
      locationName: "Initial",
      temprature: 0.0,
      coordinate: {"lon": "0", "lat": "0"},
      iconUrl: "http://openweathermap.org/img/wn/10n@2x.png",
      description: "Initial",
      maxTemperature: 0,
      minTemperature: 0,
      feelsLike: 0,
      dateTime: DateTime.now(),
      pressure: 0,
      humidity: 0);
}

class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;

  WeatherLoaded({@required this.weather}) : super(weather: weather);
}

class WeatherLoading extends WeatherState {
  WeatherLoading() : super(weather: null);
}
