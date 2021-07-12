import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //width: 300,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("We are view all movies , You can register your seat from this app And you can view movie story  ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white
            ),
          ),
        )
      ],
      );
  }
}
