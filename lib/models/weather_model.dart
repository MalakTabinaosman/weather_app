class WeatherModel {
  final String cityName;
  final String country;
  final String cityImage;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String date;
  final String weatherCondition;

  WeatherModel(
      {required this.country,
      required this.cityName,
      required this.cityImage,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.date,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      country: json["location"]["country"],
      cityName: json["location"]["name"],
      cityImage: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      date: json['current']['last_updated'],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
