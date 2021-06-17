import 'package:get_it/get_it.dart';
import 'package:weather_app/features/weather/data/repositories/weatherRepository.dart';
import 'package:weather_app/features/weather/domain/repositories/weatherRepository.dart';
import 'package:weather_app/features/weather/domain/use_cases/get_weather_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  // getIt.registerFactory(() => WeatherBloc(
  //       getWeatherUseCase: getIt(),
  //     ));

  getIt.registerLazySingleton(() => WeatherBloc(
        getWeatherUseCase: getIt(),
      ));

  getIt.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(repository: getIt()));

  getIt.registerLazySingleton<WeatherRepository>(
      () => ConcreteWeatherRepository());
}
