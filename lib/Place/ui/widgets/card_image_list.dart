import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/card_image.dart';

class CardimageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double width = 300.0;
    double height = 350.0;
    double left = 20.0;
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
            onPressedFabIcon: () {},
          ),
          CardImageWithFabIcon(
              iconData: Icons.favorite_border,
              width: width,
              height: height,
              left: left,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              iconData: Icons.favorite_border,
              width: width,
              height: height,
              left: left,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              iconData: Icons.favorite_border,
              width: width,
              height: height,
              left: left,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              iconData: Icons.favorite_border,
              width: width,
              height: height,
              left: left,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              iconData: Icons.favorite_border,
              width: width,
              height: height,
              left: left,
              onPressedFabIcon: () {}),
        ],
      ),
    );
  }
}
