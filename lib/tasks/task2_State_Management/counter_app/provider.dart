import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    if (_counter < 20) {
      _counter++;
      notifyListeners();
    }
  }

  void decrement() {
    if (_counter > 0) {
  _counter--;
  notifyListeners();
}
  }
}
