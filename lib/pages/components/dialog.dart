import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

void showFullScreenDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      final MediaQueryData mediaQuery = MediaQuery.of(context);
      final double screenWidth = mediaQuery.size.width;
      return Scaffold(
        backgroundColor: Colors.transparent, // Transparent background
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white, // Dialog content color
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: screenWidth * 0.075),
                Text(
                  "Warning!!",
                  style: TextStyles.extraBold20pt(),
                ),
                SizedBox(height: screenWidth * 0.075),
                Text.rich(
                  TextSpan(
                    style: TextStyles.reg14pt(),
                    children: [
                      const TextSpan(
                        text: "For better experience, please open it on ",
                      ),
                      TextSpan(
                        text: "computer web browser",
                        style: TextStyles.extraBold14pt(),
                      ),
                      const TextSpan(text: " instead of "),
                      TextSpan(
                        text: "mobile apps web browser",
                        style: TextStyles.extraBold14pt(),
                      ),
                      const TextSpan(
                        text: "... Please 🥺👉 👈? ",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.2),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Proceed on Mobile Apps. I Have No Choice… 😅"),
                ),
                SizedBox(height: screenWidth * 0.075),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return FadeTransition(
        opacity: anim1,
        child: child,
      );
    },
  );
}
