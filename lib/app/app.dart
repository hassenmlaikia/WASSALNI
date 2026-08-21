import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wassalni/core/theme/wassalni_theme.dart';
import 'package:wassalni/features/home/presentation/screens/home_screen.dart';
import 'package:wassalni/features/splash/presentation/screens/splash_screen.dart';

class WassalniApp extends StatelessWidget {
  const WassalniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'WASSALNI',
      debugShowCheckedModeBanner: false,
      theme: WassalniTheme.darkTheme,
      routerConfig: router,
    );
  }
}
