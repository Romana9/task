import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("TabBar App", style: TextStyle(fontSize: 24)),
          bottom: const TabBar(tabs: [
            Tab(text: "Home", icon: Icon(Icons.home)),
            Tab(text: "Profile", icon: Icon(Icons.person)),
          ],
          indicatorColor: Colors.black,
          ),
        ),
        body: const TabBarView(
          children: [
          Icon(Icons.home_filled, size: 150, color: Colors.brown),
          Icon(Icons.person, size: 150, color: Colors.brown),
        ]),
      ),
    );
  }
}
