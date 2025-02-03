import 'package:flutter/material.dart';
import 'package:shafa_25_birthday/themes/themes.dart';

class WishWidget extends StatelessWidget {
  const WishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenWidth = mediaQuery.size.width;
    final bool isMobile = screenWidth < 600;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          """
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porttitor ante ex, nec dapibus augue rutrum vel. Fusce quis ipsum dolor. Praesent auctor dui eget urna convallis, sit amet porta turpis molestie. Duis metus metus, condimentum sed sem at, sodales aliquet justo. Sed volutpat bibendum velit, eget aliquet magna fringilla eu. Sed eu pellentesque turpis. Aenean sagittis nisi eget tortor mattis aliquam. Morbi eu ex at tellus euismod placerat quis nec orci. Donec pharetra odio sit amet elit accumsan, a tincidunt augue rhoncus. Curabitur feugiat ultrices metus ut eleifend. In hac habitasse platea dictumst. Nam eu iaculis nisl. Aliquam sed magna auctor, mattis quam quis, consectetur ante. Maecenas urna odio, aliquet sagittis imperdiet vitae, pharetra nec nibh.

Cras rhoncus nulla sed leo varius, et pretium metus ultricies. Donec sed sapien ac magna convallis rutrum. Integer vulputate leo ex. Praesent imperdiet diam sit amet lacus dapibus, ut cursus tortor varius. Mauris hendrerit, nulla in maximus congue, augue dolor sollicitudin mi, at pharetra elit dui in massa. Nulla facilisi. Proin placerat ligula ut justo rutrum, at pretium erat gravida.

Curabitur in luctus est. Sed porta, dolor non commodo varius, massa neque euismod arcu, non ultricies orci neque tincidunt eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum lacus at ultricies posuere. Mauris vitae rutrum risus. Mauris condimentum neque quis sapien hendrerit porttitor sed sit amet dui. Aenean nec purus non tortor varius fringilla non in diam. In malesuada rutrum nisi, id iaculis est consectetur a.
              """,
          style: isMobile ? TextStyles.reg14pt() : TextStyles.reg16pt(),
        ),
      ),
    );
  }
}
