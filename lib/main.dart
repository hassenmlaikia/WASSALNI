import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wassalni/core/theme/wassalni_theme.dart';
import 'package:wassalni/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: _WassalniRunner(),
    ),
  );
}

class _WassalniRunner extends StatelessWidget {
  const _WassalniRunner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WASSALNI',
      debugShowCheckedModeBanner: false,
      theme: WassalniTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
