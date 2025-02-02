
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiPageWrapper extends StatefulWidget {
  final Widget child;

  const ConfettiPageWrapper({super.key, required this.child});

  @override
  State<ConfettiPageWrapper> createState() => _ConfettiPageWrapperState();
}

class _ConfettiPageWrapperState extends State<ConfettiPageWrapper> {
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
