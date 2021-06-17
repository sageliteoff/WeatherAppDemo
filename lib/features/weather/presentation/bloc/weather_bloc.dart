import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/weather/domain/entities/weatherEntity.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  WeatherBloc({@required this.getWeatherUseCase}) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeatherEvent) {
      yield WeatherLoading();
      print("wait");

      WeatherEntity weather;

      weather = await getWeatherUseCase.getWeather(event.locationName);

      yield WeatherLoaded(weather: weather);

      print("done waiting");
    } else {
      yield WeatherInitial();
    }
  }
}
