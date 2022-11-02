import 'package:flutter/cupertino.dart';

class MainViewModel extends ChangeNotifier {
  int _count = 0;
  bool isLoading = false;

  int get count => _count;

  void increment() {
    isLoading = true;
    notifyListeners();
    _count++;
    isLoading = false;
    notifyListeners();
  }
}
