import 'package:cinema_app/Screens/Login.dart';
import 'package:cinema_app/Screens/ViewMovie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/Models/Movie.dart';
import 'package:firebase_storage/firebase_storage.dart';

//import 'package:sliding_card/sliding_card.dart';
//import 'car';

class MoviesList extends StatefulWidget {
  //List movielist;
  MoviesList();

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  var Movies = Firestore.instance.collection('Movies').get();

  @override
  getimage() async{
    final ref = FirebaseStorage.instance.ref().child('');
    var url = await ref.getDownloadURL();
    print(url);
  }
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 150,
        child: StreamBuilder(
          stream: Firestore.instance.collection('Movies').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('loading');
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 130,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 3,
              itemBuilder: (context, i) {
                String id=snapshot.data.documents[i].id;
                String name = snapshot.data.documents[i]['name'];
                String image = snapshot.data.documents[i]['imageurl'];
                String rate = snapshot.data.documents[i]['Rate'];
                String story = snapshot.data.documents[i]['Story'];
                String category = snapshot.data.documents[i]['Category'];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ViewMovie(Movie(id,name,image,story,rate,category));
                    }));
                  },
                  child: Column(
                    children: <Widget>[
                      Card(
                        elevation: 10,
                        shadowColor: Colors.red,
                        child: SizedBox(
                          height: 80,
                          width: 100,
                          child: Image.network(image,fit: BoxFit.cover,),
                        ),
                      ),
                      Text(name,style: TextStyle(color: Colors.white),)
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
