import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  double left;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  bool internet;

  CardImageWithFabIcon(
      {Key? key,
      this.pathImage = "assets/img/pipe.jpg",
      required this.width,
      required this.height,
      required this.onPressedFabIcon,
      required this.iconData,
      this.internet = false,
      this.left = 0});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: 80.0, left: left),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: [
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }
}
