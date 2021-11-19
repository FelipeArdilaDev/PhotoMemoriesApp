import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Place/ui/screens/home_trips.dart';
import 'package:flutter_app/User/ui/screens/profile_trips.dart';
import 'package:flutter_app/Place/ui/screens/search_trips.dart';

class TripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white.withAlpha(10),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white54),
                  activeIcon: Icon(
                    Icons.home,
                    color: Color(0xCFF584CD1),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white54),
                  activeIcon: Icon(
                    Icons.search,
                    color: Color(0xCFF584CD1),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.white54),
                  activeIcon: Icon(
                    Icons.person,
                    color: Color(0xCFF584CD1),
                  ))
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) => ProfileTrips(),
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
          }
        },
      ),
    );
  }
}
