import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/card_image_list.dart';
import '../../../Widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [GradientBack("Bienvenido"), CardimageList()],
    );
  }
}
