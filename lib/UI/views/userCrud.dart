import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groupproject/Core/models/users.dart';
import 'package:groupproject/Core/services/db.dart';
import 'package:groupproject/UI/utils/convertdbtouser.dart';
import 'package:groupproject/UI/views/home.dart';

class UserCrud extends StatefulWidget {
  @override
  _UserCrudState createState() => _UserCrudState();
}

class _UserCrudState extends State<UserCrud> {
  BuildContext builtCtx;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var name, email, password, uid;
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userAddress1Ctrl = TextEditingController();
  TextEditingController userAddress2Ctrl = TextEditingController();
  TextEditingController userPhoneCtrl = TextEditingController();

  updateToDb() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    print('user is ${firebaseUser.displayName}');
    print('user is ${firebaseUser.email}');
    if (firebaseUser != null) {
      name = firebaseUser.displayName;
      email = firebaseUser.email;
      uid = firebaseUser.uid;
      User user = new User(name, email, userAddress1Ctrl.text,
          userAddress2Ctrl.text, int.parse(userPhoneCtrl.text));
      user.id = uid;
      Future<void> future = Db.updateUser(uid, user);
      future
          .then((ref) => {
                print('User update data is $future'),
              })
          .catchError((e) {
        print('An error occurs');
      });
    } else {
      print('Error while updating data');
    }
  }

  _delete(id) {
    List<User> userList = Convert.getUser();
    Db.deleteUser(id);
    // Convert.setTasks(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vendor Add/Update'),
        actions: <Widget>[
          FlatButton(
            child: Text('Delete User Account'),
            onPressed: () {
              //_delete();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Vendor Name:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: userNameCtrl,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.blue,
                      ),
                      hintText: 'Vendor Name',
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Vendor EmailId:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: userEmailCtrl,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        size: 25,
                        color: Colors.blue,
                      ),
                      hintText: 'Vendor EmailId',
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Vendor Address 1:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: userAddress1Ctrl,
                    maxLines: 2,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.add_location,
                        size: 25,
                        color: Colors.blue,
                      ),
                      hintText: 'Vendor Address 1',
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Vendor Address 2:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: userAddress2Ctrl,
                    maxLines: 2,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.add_location,
                        size: 25,
                        color: Colors.blue,
                      ),
                      hintText: 'Vendor Address 2',
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.only(top: 2),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Vendor Mobile No:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: userPhoneCtrl,
                    decoration: InputDecoration(
                      // enabledBorder: OutlineInputBorder(
                      //borderSide: BorderSide(color: Colors.red, width: 3.0),
                      // ),
                      icon: Icon(
                        Icons.phone_android,
                        size: 25,
                        color: Colors.blue,
                      ),
                      hintText: 'Vendor  Mobile No',
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateToDb();
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
