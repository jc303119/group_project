import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groupproject/Core/models/users.dart';

class Db {
  static final dbReference = Firestore.instance;
  static Future<DocumentReference> addUser(User user) {
    CollectionReference userCollection = dbReference.collection('users');
    Future<DocumentReference> future = userCollection.add(user.convertToMap());
    return future;
  }

  static Future<QuerySnapshot> readAllRecords() {
    Future<QuerySnapshot> querySnapshot =
        dbReference.collection('users').getDocuments();
    return querySnapshot;
  }

  static Future<void> updateUser(String id, User user) {
    Future<void> future = dbReference
        .collection('users')
        .document(id)
        .updateData(user.convertToMap());
    return future;
  }

  static deleteUser(String id) {
    dbReference.collection('users').document(id).delete();
  }
}
