import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:shafa_25_birthday/pages/wish/components/wish_widget.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class WishPage extends StatelessWidget {
  const WishPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    final bool isMobile = screenWidth < 600;
    final double margin = screenHeight * 0.075;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: margin),
            Text(
              "My Dearest Shafaaaa ⸜(｡˃ ᵕ ˂ )⸝♡",
              style: isMobile
                  ? TextStyles.extraBold28ptStix()
                  : TextStyles.extraBold60ptStix(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: margin),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
                child: Row(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: _buildGif(Assets.gifCatFlower2, screenWidth * 0.1)),
                    Expanded(child: WishWidget()),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: _buildGif(Assets.gifCatFlower, screenWidth * 0.1)),
                  ],
                ),
              ),
            ),
            SizedBox(height: margin),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Prev Page"),
            ),
            SizedBox(height: margin),
          ],
        ),
      ),
    );
  }

  Widget _buildGif(String assetPath, double height) {
    return Gif(
      height: height,
      placeholder: (_) => const Center(child: CircularProgressIndicator()),
      image: AssetImage(assetPath), // Adjust path
    );
  }
}
