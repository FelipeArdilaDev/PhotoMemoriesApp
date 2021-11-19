import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/User/ui/widgets/profile_place.dart';

class ProfilePlacesList extends StatelessWidget {
  Place place = new Place(
      'Knuckles Mountains Range',
      'Hiking. Water fall hunting. Natural bath',
      'Scenery & Photography',
      '123,123,123');
  Place place2 = new Place(
      'Mountains',
      'Hiking. Water fall hunting. Natural bath',
      'Scenery & Photography',
      '321,321,321');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace('assets/img/imagenf.jpeg', place),
          ProfilePlace('assets/img/imagend.jpeg', place2),
        ],
      ),
    );
  }
}
