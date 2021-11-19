import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";

  GradientBack(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xff584cd1),
            Color(0xff5461CC),
            Color(0xff516CCD),
            Color(0xff4268d3),
          ],
          radius: 4.5,
          stops: [0.1, 0.2, 0.21, 0.5],
          center: Alignment(1.3, 0.85),
          focalRadius: 1,
        ),
      ),
    );
  }
}
