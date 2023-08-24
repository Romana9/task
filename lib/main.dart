import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task/tasks/task3_API_Integration_and_List_Display/post_app/cubit/post_cubit.dart';
import 'package:task/tasks/task3_API_Integration_and_List_Display/weather_app/cubit/weather_cubit.dart';
import 'tasks/task2_State_Management/counter_app/provider.dart';
import 'tasks/task2_State_Management/shopping_cart/cubit/cart_cubit.dart';
import 'tasks/task3_API_Integration_and_List_Display/weather_app/weather_screen.dart';

void main() {
  runApp(const Task());
}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => PostCubit()..fetchPosts(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.brown),
          home: const SearchScreen(),

          // if you want to test Task 1[login screen, TabBar screen], put Login() in home and you can navigate to the tabBar screen
          // if you want to test Task 2 [Counter app], put CounterScreen() in home
          // if you want to test Task 2 [Shopping app], put ShoppingHome() in home and you can navigate to the Cart screen
          // if you want to test Task 3 [Post app], put PostScreen() in home
          // if you want to test Task 3 [Weather app], put SearchScreen() in home and you can search with any city and when you submit it will navigate to screen which has the data
        ),
      ),
    );
  }
}
