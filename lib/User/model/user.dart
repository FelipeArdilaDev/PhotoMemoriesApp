import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';

class User {
  final String Uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;

  //myFavoritePlaces
  //myPlaces

  User(
      {Key? key,
      @required this.Uid = "",
      required this.name,
      required this.email,
      required this.photoURL,
      this.myPlaces,
      this.myFavoritePlaces});
}
