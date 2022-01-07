import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Place/model/place.dart';
import 'package:flutter_app/User/model/user.dart';
import 'package:flutter_app/User/repository/cloud_firestore_api.dart';
import 'package:flutter_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceDate(Place place) async =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
