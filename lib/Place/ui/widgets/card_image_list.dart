import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/card_image.dart';

class CardimageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/img/imagend.jpeg"),
          CardImage("assets/img/imagenf.jpeg"),
          CardImage("assets/img/imagenl.jpeg"),
          CardImage("assets/img/imagenr.jpeg"),
          CardImage("assets/img/imagens.jpeg"),
          CardImage("assets/img/imagent.jpeg"),
        ],
      ),
    );
  }
}
