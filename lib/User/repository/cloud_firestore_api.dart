import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/Place/ui/widgets/card_image.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "place";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
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

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
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

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, User user) {
    List<Place> places = <Place>[];

    placesListSnapshot.forEach((p) {
      Place place = Place(
          id: p.documentID,
          name: p.data["name"],
          description: p.data["description"],
          urlImage: p.data["urlImage"],
          likes: p.data["likes"]);
      List usersLikedRefs = p.data["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if (user.uid == drUL.documentID) {
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .document(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      int likes = ds.data["likes"];

      _db.collection(PLACES).document(place.id).updateData({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            ? FieldValue.arrayUnion([_db.document("${USERS}/${uid}")])
            : FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });
    });
  }
}
