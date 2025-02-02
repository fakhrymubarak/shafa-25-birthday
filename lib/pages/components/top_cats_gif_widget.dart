import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/home_viewmodel.dart';
import 'package:shafa_25_birthday/themes/resources/resource.dart';

class TopCatsGifWidget extends StatefulWidget {
  const TopCatsGifWidget({super.key});

  @override
  State<TopCatsGifWidget> createState() => _TopCatsGifWidgetState();
}

class _TopCatsGifWidgetState extends State<TopCatsGifWidget>
    with TickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final playerViewModel = Provider.of<HomeViewModel>(context);

    if (playerViewModel.isPlaying) {
      _gifController.repeat(
        period: const Duration(seconds: 5),
      );
    } else {
      _gifController.stop();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGif(Assets.gifCatFlower3),
          SizedBox(width: 20), // Reduce spacing to prevent overflow
          _buildGif(Assets.gifHappyCat),
          SizedBox(width: 20),
          _buildGif(Assets.gifCatConfused),
          SizedBox(width: 20),
          _buildGif(Assets.gifCatDance),
          SizedBox(width: 20),
          _buildGif(Assets.gifOiiai),
        ],
      ),
    );
  }

  Widget _buildGif(String assetPath) => Gif(
        controller: _gifController,
        fps: 30,
        placeholder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        image: AssetImage(assetPath), // Adjust path
      );

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}
