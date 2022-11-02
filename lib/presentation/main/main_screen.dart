import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/main_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider 적용한 counter"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            mainViewModel.increment();
          },
          child: mainViewModel.isLoading == true
              ? const CircularProgressIndicator()
              : Text(
                  style: const TextStyle(fontSize: 80),
                  '${mainViewModel.count}',
                ),
        ),
      ),
    );
  }
}
