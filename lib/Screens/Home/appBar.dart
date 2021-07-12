import 'package:cinema_app/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



AppBar mainbar(String title){
  FirebaseAuth instance=FirebaseAuth.instance;
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.exit_to_app),onPressed: (){
        instance.signOut();
      },)
    ],
  );
}