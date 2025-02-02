import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/home_viewmodel.dart';
import 'package:shafa_25_birthday/themes/styles/app_themes.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final playerViewModel = Provider.of<HomeViewModel>(context);

    return ElevatedButton.icon(
      onPressed: () {
        if (playerViewModel.isPlaying) {
          playerViewModel.pause();
        } else {
          playerViewModel.play();
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 60),
        backgroundColor:
            playerViewModel.isPlaying ? AppColors.lightGray : AppColors.yellow,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      icon: Icon(
        playerViewModel.isPlaying ? Icons.pause : Icons.play_arrow,
        size: 28,
        color: Colors.black,
      ),
      label: Text(
        playerViewModel.isPlaying ? "" : "𐙚 ˚🍰 ⋆｡˚ ᡣ𐭩 ",
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
