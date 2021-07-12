import 'package:cinema_app/Models/Movie.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cinema_app/Screens/AdminViewSeats.dart';
import 'package:cinema_app/Screens/Home/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'Home/appBar.dart';
import 'ViewMovie.dart';

class AllMovies extends StatefulWidget {
  @override
  _AllMoviesState createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainbar("Movies"),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/seats.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Movies')
              .snapshots(), //hna ra7 ygeb el data mnl firestore
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            final documents = snapshot.data.docs;
            var documentID =
            snapshot.data.docs.map((documentID) => documentID.id).toList();
            // el builder daiman bi return 7aga 3lshan kda 3mlna return
            return ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 600,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      String id=documents[index].id;
                      String name = documents[index]['name'];
                      String image = documents[index]['imageurl'];
                      String rate = documents[index]['Rate'];
                      String story = documents[index]['Story'];
                      String category = documents[index]['Category'];
                      return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          height: 150,
                          decoration: BoxDecoration(color: Colors.white.withOpacity(.7),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Image(
                                  image: NetworkImage(documents[index]['imageurl']),
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                decoration: BoxDecoration(
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20,top: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text(documents[index]['name'],style: TextStyle(fontSize: 25),),
                                    SizedBox(height: 30,),
                                    Row(
                                      children: <Widget>[
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text("View Movie"),
                                          color: Colors.red,
                                          onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                                return ViewMovie(Movie(id,name,image,story,rate,category));
                                              }));
                                          },
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )

                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
