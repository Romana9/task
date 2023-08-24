part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class GetWeatherLoading extends WeatherState {}

final class GetWeatherSuccess extends WeatherState {}

final class GetWeatherFailure extends WeatherState {
  final String msg;
  GetWeatherFailure({required this.msg});
}
