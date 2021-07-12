import 'package:cinema_app/Screens/Login.dart';
import 'package:cinema_app/Screens/UserHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/Screens/AdminHome.dart';

Widget Line() {
  return Container(
    color: Colors.red,
    height: 2,
    width: 200,
    margin: EdgeInsets.symmetric(vertical: 20),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User) {
      if (User == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        print('have user');
      }
    });
  }

  Widget build(BuildContext context) {
    if(instance.currentUser.email=="admin@admin.com"){
      return AdminHome();
    }else{
      return UserHome();
    }
  }
}
