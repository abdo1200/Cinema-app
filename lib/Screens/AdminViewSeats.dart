import 'package:cinema_app/Models/Seat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Home/appBar.dart';

class ViewReservedSeats extends StatefulWidget {
  String id;

  ViewReservedSeats(this.id);

  @override
  _ViewReservedSeatsState createState() => _ViewReservedSeatsState();
}

class _ViewReservedSeatsState extends State<ViewReservedSeats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainbar("Seats"),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/seats.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Seats",
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: 400,
                    height: 300,
                    child: StreamBuilder(
                      stream: Firestore.instance
                          .collection('Seats')
                          .doc(widget.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return const Text('loading');
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8,
                            mainAxisSpacing: 1.0,
                          ),
                          itemCount: 47,
                          itemBuilder: (context, i) {
                            i++;
                            bool reserved = snapshot.data['s$i']['isReserved'];
                            bool selected = snapshot.data['s$i']['isSelected'];
                            return Row(
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 7.0, vertical: 5.0),
                                    width: MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.width / 15,
                                    decoration: BoxDecoration(
                                        color: selected
                                            ? Colors.yellow
                                            : reserved
                                                ? Colors.red
                                                : Colors.white,
                                        border: !selected && !reserved
                                            ? Border.all(
                                                color: Colors.red, width: 1.0)
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(5.0))),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                ])),
          ],
          //Text("Seats"),
        ),
      ),
    );
  }
}
