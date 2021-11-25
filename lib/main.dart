import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/ui/screens/sign_in_screen.dart';
import 'package:flutter_app/trips_cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Gallery',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            //home: TripsCupertino()),
            home: SignInScreen()),
        bloc: UserBloc());
  }
}
