import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiWishWrapper extends StatefulWidget {
  final Widget child;

  const ConfettiWishWrapper({super.key, required this.child});

  @override
  State<ConfettiWishWrapper> createState() => _ConfettiWishWrapperState();
}

class _ConfettiWishWrapperState extends State<ConfettiWishWrapper> {
  late ConfettiController _controllerTopRight;
  late ConfettiController _controllerTopLeft;

  @override
  void initState() {
    super.initState();
    _controllerTopLeft = ConfettiController(
      duration: const Duration(seconds: 10),
    );
    _controllerTopRight = ConfettiController(
      duration: const Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {

      _controllerTopRight.play();
      _controllerTopLeft.play();


    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return SafeArea(
      child: Stack(
        children: [
          Center(child: widget.child),
          Positioned(
            top: 0,
            left: isMobile ? 25 : 100,
            child: ConfettiWidget(
              confettiController: _controllerTopLeft,
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
            right: isMobile ? 25 : 100,
            child: ConfettiWidget(
              confettiController: _controllerTopRight,
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerTopRight.dispose();
    _controllerTopLeft.dispose();
    super.dispose();
  }
}
