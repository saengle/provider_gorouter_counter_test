import 'package:flutter/cupertino.dart';

class MainViewModel extends ChangeNotifier {
  int _count = 0;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int get count => _count;

  void increment() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _count++;
    _isLoading = false;
    notifyListeners();
  }
}
