import 'package:flutter/material.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImage;
  int likes = 0;
  bool liked;
  //User userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.urlImage,
      required this.likes,
      this.liked = false,
      this.id
      //@required this.userOwner
      });
}
