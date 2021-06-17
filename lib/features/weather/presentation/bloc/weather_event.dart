part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String locationName;
  GetWeatherEvent({@required this.locationName});
}
