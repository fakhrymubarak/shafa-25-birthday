import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/pages/confetti_page_wrapper.dart';
import 'package:shafa_25_birthday/pages/music_player_widget.dart';
import 'package:shafa_25_birthday/pages/wish_page.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfettiPageWrapper(
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
              AudioPlayerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}