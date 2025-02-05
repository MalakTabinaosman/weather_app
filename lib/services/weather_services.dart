import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  
  final Dio dio;
  final String domain = "api.weatherapi.com";
  WeatherServices({required this.dio});
  WeatherServices weatherServices = WeatherServices(dio: Dio());
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          "http://$domain/v1/forecast.json?key=5700365f713e4f228f0112045250302&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on Exception catch (e) {
      throw Exception("Failed to fetch weather data: $e"); 
    }
  }
}
