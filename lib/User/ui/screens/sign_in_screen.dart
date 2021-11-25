import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/Widgets/button_green.dart';
import 'package:flutter_app/Widgets/gradient_back.dart';
import 'package:flutter_app/trips_cupertino.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc userBloc = new UserBloc();
  double? screenWidht;
  @override
  Widget build(BuildContext context) {
    screenWidht = MediaQuery.of(context).size.width;
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return TripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(height: 0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWidht,
                  child: Text(
                    "Bienvenido\nA tu aplicación de viajes",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {
                    userBloc.signOut();
                    userBloc.signIn().then((FirebaseUser user) {
                      userBloc.updateUserData(User(
                          Uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl));
                    });
                  },
                  height: 50.0,
                  width: 300.0)
            ],
          )
        ],
      ),
    );
  }
}
