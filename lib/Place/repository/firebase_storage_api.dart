import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseStorageAPI {
  final StorageReference _storageReference = FirebaseStorage.instance.ref();

  Future<StorageUploadTask> uploadFile(String path, File image) async {
    return _storageReference.child(path).putFile(image);
  }
}
