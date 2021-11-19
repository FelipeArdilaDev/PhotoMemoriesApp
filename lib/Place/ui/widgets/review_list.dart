import 'package:flutter/material.dart';

import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/dog.jpg", "Aquiles Traigo", "1 review  5 photos",
            "There is an amazing place in Sri Lanka"),
        Review("assets/img/fast.jpg", "Alam Brito", "2 review  3 photos",
            "There is an amazing place in Sri Lanka"),
        Review("assets/img/descarga.jfif", "Esteban Quito",
            "1 review  5 photos", "There is an amazing place in Sri Lanka")
      ],
    );
  }
}
