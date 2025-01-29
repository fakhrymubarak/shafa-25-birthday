import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/pages/wish_page.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfettiPage(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Happy 25ᵗʰ Birthday \nShafaa Salsabilaaaa ⸜(｡˃ ᵕ ˂ )⸝♡",
                style: TextStyles.extraBold60ptStix(),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WishPage()),
                  );
                },
                child: Text("Next Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfettiPage extends StatefulWidget {
  final Widget child;

  const ConfettiPage({super.key, required this.child});

  @override
  State<ConfettiPage> createState() => _ConfettiPageState();
}

class _ConfettiPageState extends State<ConfettiPage> {
  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 25));
    _controllerTopCenter.play();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 100,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi,
              maxBlastForce: 5,
              // set a lower max blast force
              minBlastForce: 2,
              // set a lower min blast force
              emissionFrequency: 0.2,
              numberOfParticles: 10,
              // a lot of particles at once
              gravity: 0.75,
            ),
          ),
          Positioned(
            top: 0,
            right: 100,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi,
              maxBlastForce: 5,
              // set a lower max blast force
              minBlastForce: 2,
              // set a lower min blast force
              emissionFrequency: 0.2,
              numberOfParticles: 10,
              // a lot of particles at once
              gravity: 0.75,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerTopCenter,
              blastDirection: pi,
              maxBlastForce: 5,
              // set a lower max blast force
              minBlastForce: 2,
              // set a lower min blast force
              emissionFrequency: 0.2,
              numberOfParticles: 10,
              // a lot of particles at once
              gravity: 0.74,
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
