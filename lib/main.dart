import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wassalni/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization would go here
  // await Firebase.initializeApp();

  runApp(
    const ProviderScope(
      child: WassalniApp(),
    ),
  );
}
