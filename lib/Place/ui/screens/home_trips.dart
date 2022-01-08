import 'package:flutter/material.dart';
import 'package:flutter_app/Place/ui/widgets/review_list.dart';

import '../widgets/description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {
  String descriptionDummy =
      "Colombia se ubica en el extremo noroccidental de América del Sur, con una superficie de 1.141.748 Km2, tiene costas en el Pacífico y en el Atlántico. Atravesada de Sur a Norte por los Andes que, cerca de la frontera meridional se dividen en tres ramales: cordilleras Occidental, Central y Oriental.";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Bahamas", 4, descriptionDummy),
            ReviewList()
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
}
