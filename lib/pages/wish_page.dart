import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class WishPage extends StatelessWidget {
  const WishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "We Wish ⸜(｡˃ ᵕ ˂ )⸝♡",
              style: TextStyles.extraBold60ptStix(),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("Prev Page")),
                ElevatedButton(onPressed: () {}, child: Text("Next Page"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
