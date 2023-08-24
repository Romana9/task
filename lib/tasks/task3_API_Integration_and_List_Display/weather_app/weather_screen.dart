// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/tasks/task3_API_Integration_and_List_Display/weather_app/cubit/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Search", style: TextStyle(fontSize: 24)),
          ),
          body: Center(
            child: state is GetWeatherLoading
                ? const CircularProgressIndicator(
                    color: Colors.brown,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      onSubmitted: (data) async {
                        WeatherCubit.get(context).cityName = data;
                        await WeatherCubit.get(context).getWeather();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WeatherScreen()));
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter a City",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(25),
                          label: Text("Search")),
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Weather App', style: TextStyle(fontSize: 24)),
          ),
          body: state is GetWeatherFailure
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.not_interested,
                          size: 200, color: Colors.brown),
                      const SizedBox(height: 16),
                      Text(
                        state.msg,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.brown),
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    Text(
                      WeatherCubit.get(context).location!["name"],
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Updated: ${WeatherCubit.get(context).location!["localtime"]}",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${WeatherCubit.get(context).current!["temp_c"].round()}°",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Maxtemp: ${WeatherCubit.get(context).forcast!["day"]["maxtemp_c"].round()}°",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Mintemp: ${WeatherCubit.get(context).forcast!["day"]["mintemp_c"].round()}°",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      WeatherCubit.get(context).current!["condition"]["text"],
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
        );
      },
    );
  }
}
