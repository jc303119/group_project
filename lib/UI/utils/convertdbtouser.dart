import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupproject/Core/models/users.dart';
import 'package:groupproject/Core/services/db.dart';

class Convert {
  static List<User> userList;
  static List<User> getUser() {
    return userList;
  }

  static void setTasks(List<User> users) {
    userList = users;
  }

  static Future<List<User>> convertDbToUser() async {
    QuerySnapshot result = await Db.readAllRecords();
    result.documents.forEach((doc) {
      User user = new User(doc['name'], doc['email']);
      user.id = doc.documentID;
      userList.add(user);
    });
    return userList;
  }
}
