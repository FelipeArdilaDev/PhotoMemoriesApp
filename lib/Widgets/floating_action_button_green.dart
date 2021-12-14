import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData? iconData;
  final VoidCallback? onPressed;
  FloatingActionButtonGreen(
      {Key? key, @required this.iconData, @required this.onPressed});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatinfActionButtonGreen();
  }
}

class _FloatinfActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool _pressed = false;

  /*void onPressedFav() {
    setState(() {
      _pressed = !this._pressed;
    });
    Scaffold.of(context).showSnackBar(SnackBar(
        content: this._pressed
            ? Text("Agregaste a tus favoritos")
            : Text("Quitaste de tus favoritos")));
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(this._pressed ? Icons.favorite : Icons.favorite_border),
      heroTag: null,
    );
  }
}
