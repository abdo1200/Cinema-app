import 'package:cinema_app/Models/Movie.dart';
import 'package:cinema_app/Screens/Home/appBar.dart';
import 'package:cinema_app/Screens/ViewSeats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewMovie extends StatefulWidget {
  Movie movie;
  ViewMovie(this.movie);

  @override
  _ViewMovieState createState() => _ViewMovieState();
}

class _ViewMovieState extends State<ViewMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainbar("Movie Details"),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/seats.jpg'),
                  fit: BoxFit.cover)),
          width: double.infinity,
          height: 650,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 230,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.movie.name + " (2019)",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Container(
                              height: 2,
                              color: Colors.white,
                              width: 200,
                              margin: EdgeInsets.symmetric(vertical: 20),
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Rate : " + widget.movie.rate,
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Quality : Hd",
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Category : " + widget.movie.category,
                                      style: TextStyle(
                                          fontSize: 19, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Image(
                          image: NetworkImage(widget.movie.image),
                          height: 200,
                          width: 130,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Story :",
                      style: TextStyle(fontSize: 19,color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.7),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        widget.movie.story,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        color: Colors.red,
                        child: Text(
                          "Reserve Seat",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ViewSeats(
                                widget.movie.id, widget.movie.name);
                          }));
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
