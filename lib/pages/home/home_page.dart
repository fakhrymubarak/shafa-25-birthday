import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/home/components/confetti_page_wrapper.dart';
import 'package:shafa_25_birthday/pages/components/dialog.dart';
import 'package:shafa_25_birthday/pages/home/components/top_cats_gif_widget.dart';
import 'package:shafa_25_birthday/pages/home/home_viewmodel.dart';
import 'package:shafa_25_birthday/pages/home/components/music_player_widget.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

import '../confirmation/confirmation_page.dart';

class MyHomePage extends StatelessWidget {
  static bool _dialogShown = false;

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    final bool isMobile = screenWidth < 600;
    final double margin = screenHeight * 0.05;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isMobile && !_dialogShown) {
        _dialogShown = true; // Mark as shown
        showFullScreenDialog(context);
      }
    });

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1400),
            child: ConfettiPageWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: margin),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationPage()),
                      );
                    },
                    child: Text("Tap for Your BF’s Wish! (˶ᵔ ᵕ ᵔ˶)"),
                  ),
                  SizedBox(height: margin),
                  SizedBox(
                    height: screenHeight * 0.15,
                    child: TopCatsGifWidget(),
                  ),
                  SizedBox(height: margin),
                  Text(
                    "Happy 25ᵗʰ Birthday \nShafaa Salsabilaaaa \n⸜(｡˃ ᵕ ˂ )⸝♡",
                    style: isMobile
                        ? TextStyles.extraBold28ptStix()
                        : TextStyles.extraBold60ptStix(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: margin),
                  AudioPlayerWidget(),
                  SizedBox(height: margin),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
