//import 'dart:html';
import 'dart:ui';
import 'package:cinema_app/Screens/AdminViewSeats.dart';
import 'package:cinema_app/Screens/Home/appBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMoviesF extends StatelessWidget {
  Widget textStyling(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  //ana de m5liaha fel main fel main.dart mtnsesh trg3eha mkanha
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
                                      child: Text("View Seats"),
                                      color: Colors.red,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewReservedSeats(documentID[index])));
                                      },
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(left: 30),
                                      icon: Icon(Icons.delete_forever),
                                      iconSize: 30,
                                      color: Colors.red[400],
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('Movies')
                                            .doc(documentID[index])
                                            .delete();
                                      },
                                    ),
                                    ],
                                  )
                                  ],
                                ),
                              )
                            ],
                          )

//                          Card(
//                            color: Colors.white.withOpacity(0.7),
//                            child: Column(
//                              mainAxisSize: MainAxisSize.min,
//                              children: <Widget>[
//                                ListTile(
//                                  leading: Container(
//                                    margin: EdgeInsets.all(10),
//                                    width: 100,
//                                    decoration: BoxDecoration(
//                                        image: DecorationImage(
//                                          image: NetworkImage(documents[index]['imageurl']),
//                                          fit: BoxFit.cover,
//                                        )
//                                    ),
//                                  ),
//                                  title: Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      Text(
//                                        documents[index]['name'],
//                                        style: TextStyle(fontSize: 16),
//                                      ),
//                                    ],
//                                  ),
//                                ),
////                                ButtonBar(
////                                  children: <Widget>[
////                                    RaisedButton(
////                                      shape: RoundedRectangleBorder(
////                                          borderRadius: BorderRadius.circular(20)),
////                                      child: Text("Seats"),
////                                      color: Colors.red,
////                                      onPressed: () {
////                                        Navigator.push(
////                                            context,
////                                            MaterialPageRoute(
////                                                builder: (context) =>
////                                                    ViewReservedSeats(documentID[index])));
////                                      },
////                                    ),
////                                    IconButton(
////                                      padding: EdgeInsets.only(left: 30),
////                                      icon: Icon(Icons.delete_forever),
////                                      iconSize: 30,
////                                      color: Colors.red[400],
////                                      onPressed: () async {
////                                        await FirebaseFirestore.instance
////                                            .collection('Movies')
////                                            .doc(documentID[index])
////                                            .delete();
////                                      },
////                                    ),
////                                  ],
////                                ),
//                              ],
//                            ),
//                      )
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
