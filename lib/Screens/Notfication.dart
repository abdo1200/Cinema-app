import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Home/appBar.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainbar("Notifications"),
      body: SingleChildScrollView(
        child: Container(
          height: 605,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/seats.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  stream:
                      Firestore.instance.collection('Notifications').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('loading');
                    int size = snapshot.data.size;
                    return Column(
                      children: <Widget>[
                        for (int i = 0; i < size; i++)
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: (snapshot.data.documents[i]['seen']==false)?Icon(Icons.new_releases,color: Colors.red,):Icon(Icons.check),
                                  title:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(snapshot.data.documents[i]['name'],style: TextStyle(fontSize: 20,),),
                                          Text(snapshot.data.documents[i]['seats']+" Reserved From "+snapshot.data.documents[i]['email'],style: TextStyle(
                                              fontSize: 12
                                          ),)
                                        ],
                                      ),
                                  subtitle:
                                      Text(snapshot.data.documents[i]['date']),
                                ),
                              ],
                            ),
                          )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
