import 'package:flutter/material.dart';
import 'Place/ui/screens/home_trips.dart';
import 'User/ui/screens/profile_trips.dart';
import 'Place/ui/screens/search_trips.dart';
import 'package:flutter/cupertino.dart';

class Trips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Trips();
  }
}

class _Trips extends State<Trips> {
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    HomeTrips(),
    ProfileTrips(),
    SearchTrips()
  ];

  void onTapTapperd(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: new Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigationBar(
            currentIndex: indexTap,
            onTap: onTapTapperd,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.indigo,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.indigo),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.indigo),
                label: "",
              ),
            ],
          )),
    );
  }
}
