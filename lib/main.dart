import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/trips_cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TripsCupertino());
  }
}
