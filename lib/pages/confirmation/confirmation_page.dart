import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/confirmation/confirmation_viewmodel.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

import '../wish_page.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final double screenHeight = mediaQuery.size.height;
    final bool isMobile = screenWidth < 600;
    final double margin = screenHeight * 0.075;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => ConfirmationViewModel(),
        child: Builder(builder: (context) {
          final viewModel = Provider.of<ConfirmationViewModel>(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: margin),
                Text(
                  "Next Page Belongs to \nShafa Only (  •̀ - •́  ) !!!",
                  style: isMobile
                      ? TextStyles.extraBold28ptStix()
                      : TextStyles.extraBold60ptStix(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: margin),
                Text(
                  "Proof that you are real Shafa( •̀⤙•́)",
                  style: isMobile
                      ? TextStyles.semiBold24pt()
                      : TextStyles.semiBold16pt(),
                ),
                SizedBox(height: 16),
                Text(
                  "Since high school, what song has your boyfriend always reminded you of?",
                  style: isMobile ? TextStyles.reg24pt() : TextStyles.reg16pt(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    onChanged: (value) => viewModel.onAnswerChanged(value),
                    decoration: InputDecoration(
                      hintText: "Enter song name...",
                      border: OutlineInputBorder(),
                    ),
                    style:
                        isMobile ? TextStyles.reg24pt() : TextStyles.reg16pt(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (viewModel.checkHashes()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WishPage()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(viewModel.getErrorMessage()),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 60),
                    backgroundColor: AppColors.yellow,
                  ),
                  child: Text(
                    "Submit Answer (୨୧ ❛ᴗ❛)✧",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: margin),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Prev Page (◞‸ ◟)💧"),
                ),
                SizedBox(height: margin),
              ],
            ),
          );
        }),
      ),
    );
  }
}
