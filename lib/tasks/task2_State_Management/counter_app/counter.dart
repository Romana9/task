import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Counter App', style: TextStyle(fontSize: 24))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Provider.of<CounterProvider>(context, listen: false)
                      .decrement();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.brown,
                  radius: 23,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ),
              Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
                  return Text(
                    '${counterProvider.counter}',
                    style: const TextStyle(fontSize: 36),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  Provider.of<CounterProvider>(context, listen: false)
                      .increment();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.brown,
                  radius: 23,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
