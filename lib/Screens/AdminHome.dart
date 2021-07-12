import 'package:cinema_app/Screens/AddingForm.dart';
import 'package:cinema_app/Screens/Home/appBar.dart';
import 'package:cinema_app/Screens/ListMoviesF.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Notfication.dart';
import 'viewReservedSeats.dart';

class AdminHome extends StatelessWidget {
  FirebaseAuth instance=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Panal"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.exit_to_app),onPressed: (){
              instance.signOut();
            },)
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/seats.jpg'),
                fit: BoxFit.cover
              )
            ),
            width: double.infinity,
            padding: EdgeInsets.only(top:80,bottom: 101),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddingMovieForm(),
                            ),
                          );
                        },
                        child: Column(children: <Widget>[
                          Icon(Icons.movie_creation,size: 60,color: Colors.white,),
                          Text('Add Movie',style: TextStyle(color: Colors.white,),),
                        ],),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListMoviesF(),
                            ),
                          );
                        },
                        child: Column(children: <Widget>[
                          Icon(Icons.view_comfy,size: 60,color: Colors.white,),
                          Text('View Movie',style: TextStyle(color: Colors.white),),
                        ],),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Notifications()));
                        },
                        child: Column(children: <Widget>[
                          Icon(Icons.notifications,size: 60,color: Colors.white,),
                          Text('Notifications',style: TextStyle(color: Colors.white),),
                        ],),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
