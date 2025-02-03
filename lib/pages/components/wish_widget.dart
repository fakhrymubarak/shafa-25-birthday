import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';
import 'package:shafa_25_birthday/pages/wish_viewmodel.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class WishWidget extends StatelessWidget {
  const WishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final bool isMobile = screenWidth < 600;

    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (_) => WishViewModel(),
        child: Builder(
          builder: (context) {
            final wishViewModel = Provider.of<WishViewModel>(context);
            return wishViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: HtmlWidget(
                      wishViewModel.wishes,
                      textStyle: isMobile
                          ? TextStyles.reg14pt()
                          : TextStyles.reg16pt(),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
