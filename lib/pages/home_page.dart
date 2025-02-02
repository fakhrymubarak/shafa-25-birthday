import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/components/confetti_page_wrapper.dart';
import 'package:shafa_25_birthday/pages/components/top_cats_gif_widget.dart';
import 'package:shafa_25_birthday/pages/home_viewmodel.dart';
import 'package:shafa_25_birthday/pages/music_player_widget.dart';
import 'package:shafa_25_birthday/pages/wish_page.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        child: ConfettiPageWrapper(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150),
                AudioPlayerWidget(),
                SizedBox(height: 150),
                SizedBox(height: 150, child: TopCatsGifWidget()),
                SizedBox(height: 150),
                Text(
                  "Happy 25ᵗʰ Birthday \nShafaa Salsabilaaaa ⸜(｡˃ ᵕ ˂ )⸝♡",
                  style: TextStyles.extraBold60ptStix(),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WishPage()),
                    );
                  },
                  child: Text("Tap for Your BF’s Wish! (˶ᵔ ᵕ ᵔ˶)"),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
