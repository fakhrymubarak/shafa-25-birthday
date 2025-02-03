import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/pages/home_page.dart';
import 'package:shafa_25_birthday/themes/styles/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy 25ᵗʰ Birthday Shafaa ♡',
      theme: getAppTheme(context),
      home: Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1400),
            child: const MyHomePage(),
          ),
        ),
      ),
    );
  }
}
