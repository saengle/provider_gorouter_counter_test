import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_gorouter_counter/presentation/auth_gate/auth_gate.dart';
import 'package:provider_gorouter_counter/presentation/main_view_model.dart';
import 'package:provider_gorouter_counter/presentation/memo_write/memo_write_screen.dart';
import 'package:provider_gorouter_counter/presentation/memo_write/memo_write_view_model.dart';

abstract class Routes {
  static const String homeRoute = '/';
  static const String writeRoute = '/memo_write';
}

final GoRouter router = GoRouter(
  initialLocation: Routes.homeRoute,
  routes: <GoRoute>[
    GoRoute(
      path: Routes.homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(),
          child: const AuthGate(),
        );
      },
    ),
    GoRoute(
      path: Routes.writeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => MemoWriteViewModel(),
          child: const MemoWriteScreen(),
        );
      },
    ),
  ],
);
