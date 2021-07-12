import 'package:cinema_app/Screens/AllMovies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import 'Home/About.dart';
import 'Home/MainPage.dart';
import 'Home/MoviesList.dart';
import 'Home/appBar.dart';
import 'Login.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  FirebaseAuth instance = FirebaseAuth.instance;

//  Firestore.instance.collection('Movies').get().then((value){
//  Movie('Mulan',"assets/images/mulan.jpg","Animation");
//  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainbar("Home"),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/seats.jpg'),
                  fit: BoxFit.cover
              )
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // latest movies
                Text(
                  "Latest Movies",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                MoviesList(),
                // line
                Line(),
                Container(
                  margin: EdgeInsets.only(left:20,right: 20),
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/all.jpg'),
                        fit: BoxFit.cover
                    ),
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(.3),
                    child: Center(
                      child: RaisedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllMovies(),
                            ),
                          );
                        },
                        color: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                        child: Text("All Movies",style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ),
                  ),
                ),
                Line(),
                // about us
                Text(
                  "About Us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                About(),
              ],
            ),
          ),
        ));
  }
}
