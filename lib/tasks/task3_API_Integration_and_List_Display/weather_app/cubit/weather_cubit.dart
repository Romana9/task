import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  String? cityName;
  Map? location;
  Map? current;
  Map? forcast;
  List? forcastDays;

  Future getWeather() async {
    emit(GetWeatherLoading());
    http.Response response = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=15d444399eb544c0ac9164352231802&q=$cityName&days=10"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      location = data["location"];
      current = data["current"];
      forcast = data["forecast"]["forecastday"][0];
      forcastDays = data["forecast"]["forecastday"];
      print(location);
      print(current);
      print(forcast);
      emit(GetWeatherSuccess());
    } else if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      print(data);
      emit(GetWeatherFailure(msg: data["error"]["message"]));
    }
  }
}
