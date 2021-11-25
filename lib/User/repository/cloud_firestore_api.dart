import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACE = "place";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.Uid);
    return ref.setData({
      'uid': user.Uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIng': DateTime.now()
    }, merge: true);
  }
}
