import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/home_viewmodel.dart';

class TiltImageWidget extends StatefulWidget {
  final String assetPath;
  final bool isMirror;

  const TiltImageWidget(
      {super.key, required this.assetPath, required this.isMirror});

  @override
  State<TiltImageWidget> createState() => _TiltImageWidgetState();
}

class _TiltImageWidgetState extends State<TiltImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Smooth tilting
      lowerBound: -0.1, // Tilt to the left
      upperBound: 0.1, // Tilt to the right
    )..repeat(reverse: true); // Repeat with smooth reversing
  }

  @override
  Widget build(BuildContext context) {
    final playerViewModel = Provider.of<HomeViewModel>(context);

    if (playerViewModel.isPlaying) {
      _animationController.repeat(reverse: true);
    } else {
      _animationController.stop();
      _animationController.value = 0; // Reset tilt when stopped
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: widget.isMirror
              ? (Matrix4.rotationY(pi) *
                  Matrix4.rotationZ(_animationController.value))
              : Matrix4.rotationZ(_animationController.value),
          child: Image.asset(
            widget.assetPath,
            height: 500,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
