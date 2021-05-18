import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupproject/Core/models/users.dart';
import 'package:groupproject/Core/services/db.dart';
import 'package:groupproject/UI/views/home.dart';
import 'package:groupproject/UI/views/register.dart';
import 'package:groupproject/UI/views/userCrud.dart';

class Login extends StatefulWidget {
  User userObject;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userPasswordCtrl = TextEditingController();
  FirebaseUser user;

  register() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  Future<FirebaseUser> signInUserWithEmailAndPassword(
      [String email, String pwd]) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pwd);
      user = result.user;
      print('User is $user');
    } on PlatformException catch (e) {
      print('Error in Login $e');
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Login Here',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: userEmailCtrl,
                decoration: InputDecoration(
                  hintText: 'Enter your Email Address',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: userPasswordCtrl,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(500)),
              child: RaisedButton(
                color: Colors.orangeAccent,
                onPressed: () {
                  signInUserWithEmailAndPassword(
                      userEmailCtrl.text, userPasswordCtrl.text);
                },
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'OR',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                color: Colors.grey,
                onPressed: () {
                  register();
                },
                padding: EdgeInsets.all(10),
                child: Text(
                  'Create your Account',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
