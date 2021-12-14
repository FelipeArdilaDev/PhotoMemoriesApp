import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/Place/ui/widgets/card_image.dart';
import 'package:flutter_app/Place/ui/widgets/title_input_location.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/Widgets/button_purple.dart';
import 'package:flutter_app/Widgets/gradient_back.dart';
import 'package:flutter_app/Widgets/text_input.dart';
import 'package:flutter_app/Widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen({Key? key, required this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(children: <Widget>[
        GradientBack(height: 300.0),
        Row(
          //App Bar
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25.0, left: 5.0),
              child: SizedBox(
                height: 45.0,
                width: 45.0,
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 45,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Flexible(
                child: Container(
              padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
              child: TitleHeader(title: "Agrega Tu foto!"),
            ))
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: CardImageWithFabIcon(
                    pathImage: widget.image, //widget.image.path
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0,
                    onPressedFabIcon: () {}),
              ), //Foto
              Container(
                // TExtField Title
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextInput(
                  hintText: "Titulo",
                  inputType: null,
                  maxLines: 1,
                  controller: _controllerTitlePlace,
                ),
              ),
              TextInput(
                  //Description
                  hintText: "Descripcion",
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: _controllerDescriptionPlace),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextInputLocation(
                  hintText: "Agrega una ubicacion",
                  icondata: Icons.location_on,
                ),
              ),
              Container(
                width: 70.0,
                child: ButtonPurple(
                  buttonText: "Agregar foto",
                  onPressed: () {
                    //1. Firebase Storage
                    //yrl -

                    //2. Cloud FIrestore
                    //Place - titylo, descripcion, url, userOwner, likes
                    userBloc
                        .updatePlaceDate(Place(
                            name: _controllerTitlePlace.text,
                            description: _controllerDescriptionPlace.text,
                            likes: 0,
                            urlImage: "assets/img/imagens.jpeg"))
                        .whenComplete(() {
                      print("TERMINO");
                      Navigator.pop(context);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
