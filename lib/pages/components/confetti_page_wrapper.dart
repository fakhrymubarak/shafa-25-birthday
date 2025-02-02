import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/components/tilt_image.dart';
import 'package:shafa_25_birthday/pages/home_viewmodel.dart';
import 'package:shafa_25_birthday/themes/resources/resource.dart';

class ConfettiPageWrapper extends StatefulWidget {
  final Widget child;

  const ConfettiPageWrapper({super.key, required this.child});

  @override
  State<ConfettiPageWrapper> createState() => _ConfettiPageWrapperState();
}

class _ConfettiPageWrapperState extends State<ConfettiPageWrapper> {
  late ConfettiController _controllerTopCenter;
  late ConfettiController _controllerTopRight;
  late ConfettiController _controllerTopLeft;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 15));
    _controllerTopLeft =
        ConfettiController(duration: const Duration(seconds: 15));
    _controllerTopRight =
        ConfettiController(duration: const Duration(seconds: 15));
  }

  @override
  Widget build(BuildContext context) {
    final playerViewModel = Provider.of<HomeViewModel>(context);

    if (playerViewModel.isPlaying) {
      _controllerTopCenter.play();
      _controllerTopRight.play();
      _controllerTopLeft.play();
    } else {
      _controllerTopCenter.stop();
      _controllerTopRight.stop();
      _controllerTopLeft.stop();
    }

    return SafeArea(
      child: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 0,
            left: 0,
            child: TiltImageWidget(assetPath: Assets.imgShafa, isMirror: false),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: TiltImageWidget(assetPath: Assets.imgShafa, isMirror: true),
          ),
          Positioned(
            top: 0,
            left: 100,
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
            right: 100,
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    _controllerTopRight.dispose();
    _controllerTopLeft.dispose();
    super.dispose();
  }
}
