import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/main/main_screen.dart';
import 'package:provider_gorouter_counter/presentation/main_view_model.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const MainScreen(),
        );
      },
    ),
  ],
);
