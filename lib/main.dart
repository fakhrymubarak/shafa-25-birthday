import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/pages/home_page.dart';
import 'package:shafa_25_birthday/themes/styles/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy 25ᵗʰ Birthday Shafaa ♡',
      theme: getAppTheme(context),
      home: const MyHomePage(),
    );
  }
}
