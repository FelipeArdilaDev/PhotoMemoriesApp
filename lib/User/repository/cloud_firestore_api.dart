import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "place";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.Uid);
    return await ref.setData({
      'uid': user.Uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIng': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    String uid = (await _auth.currentUser()).uid;
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.document("$USERS/$uid"), //reference
      'urlImage': place.urlImage,
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        // ID place REFERENCIA ARRAY
        DocumentReference refUsers = _db.collection(USERS).document(uid);
        refUsers.updateData({
          "myPlaces": FieldValue.arrayUnion(
              [_db.document("$PLACES/${snapshot.documentID}")])
        });
      });
    });
  }

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = <ProfilePlace>[];
    placesListSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(
        Place(
            name: p.data["name"],
            description: p.data["description"],
            urlImage: p.data["urlImage"],
            likes: p.data['likes']),
      ));
    });
    return profilePlaces;
  }
}
