import 'package:flutter/material.dart';
import 'package:groupproject/UI/views/userCrud.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  String msg;
  TextEditingController userID = TextEditingController();
  TextEditingController password = TextEditingController();

  user() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserCrud()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(
                  'Hi',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Row(
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(
                  'Deliver at ',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              onPressed: () {
                Home();
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              onPressed: () {
                user();
              },
            ),
          ],
        ),
      ),
    );
  }
}
