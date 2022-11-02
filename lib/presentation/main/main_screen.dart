import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int counter = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            setState(() {
              isLoading = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              counter++;
              isLoading = false;
            });
          },
          child: isLoading == true
              ? const CircularProgressIndicator()
              : Text(
                  style: const TextStyle(fontSize: 80),
                  '$counter',
                ),
        ),
      ),
    );
  }
}
