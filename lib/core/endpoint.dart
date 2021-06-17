const String API_KEY = "2ebb6b44b2cd0f0931930e3f7d5d9d92";

const String baseEndpoint = "https://api.openweathermap.org/data/2.5/weather";

String getWeatherByCityNameEndpoint(String cityName) {
  return "$baseEndpoint?q=$cityName&appid=$API_KEY";
}

String getIconUrlEndpoint(String iconName) {
  return "https://openweathermap.org/img/wn/$iconName@2x.png";
}
