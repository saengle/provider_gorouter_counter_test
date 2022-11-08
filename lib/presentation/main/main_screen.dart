import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/main_view_model.dart';
import 'package:provider_gorouter_counter/presentation/routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 적용한 counter'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                context.push(Routes.writeRoute);
              },
              icon: const Icon(Icons.note))
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            viewModel.increment();
          },
          child: viewModel.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  style: const TextStyle(fontSize: 80),
                  '${viewModel.count}',
                ),
        ),
      ),
    );
  }
}
