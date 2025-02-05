import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(super.WeatherInitialState);

  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel = await WeatherServices(dio: Dio())
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel));
    } on Exception catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
