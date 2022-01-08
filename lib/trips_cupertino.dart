import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Place/ui/screens/home_trips.dart';
import 'package:flutter_app/User/bloc/bloc_user.dart';
import 'package:flutter_app/User/ui/screens/profile_trips.dart';
import 'package:flutter_app/Place/ui/screens/search_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class TripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: Colors.white.withAlpha(70),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.lightBlueAccent),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.indigo,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.lightBlueAccent),
                  activeIcon: Icon(
                    Icons.search,
                    color: Colors.indigo,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.lightBlueAccent),
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ))
            ]),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: HomeTrips(),
                  );
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    bloc: UserBloc(),
                    child: ProfileTrips(),
                  );
                },
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
