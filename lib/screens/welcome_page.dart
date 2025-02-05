import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_state.dart';
import 'package:weather_app/cubits/getWeatherCubit/get_weather_cubit.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_information.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            icon: const Icon(Icons.search, color: Colors.blueGrey),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherWidget();
          } else if (state is WeatherLoadedState) {
            return WeatherInformation(
              weatherModel: state.weatherModel,
            );
          } else {
            return Text("opps there was an error ...");
          }
        },
      ),
    ); 
  }
}
