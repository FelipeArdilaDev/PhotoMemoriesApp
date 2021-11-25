import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "Popular";
  double height = 0.0;

  GradientBack({Key? key, required this.height}); //height = null full screen

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    if (height == 0) {
      height = screenHeight;
    }

    return Container(
      width: screenWidht,
      height: height,
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
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        ),
      ),
      /*Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,

        ),
      ),*/
      //alignment: Alignment(-0.9, -0.6),
    );
  }
}
