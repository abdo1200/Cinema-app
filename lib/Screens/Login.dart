import 'dart:math';
import 'package:cinema_app/Screens/Home/MainPage.dart';
import 'package:cinema_app/Screens/Home/appBar.dart';
import 'package:cinema_app/Screens/ListMoviesF.dart';
import 'package:cinema_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visibal = true;
  String _email, _password;
  var loginkey = GlobalKey<ScaffoldState>();
  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cinema App"),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/seats.jpg'),
                    fit: BoxFit.cover
                )
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "enter email",
                      suffixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        this._email = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        this._password = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "enter password",
                      suffixIcon: IconButton(
                        icon: Icon(
                            visibal ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            visibal = !visibal;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: visibal,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                      color: Colors.red,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        try {
                          await instance.signInWithEmailAndPassword(email: _email, password: _password);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
//                            loginkey.currentState.showSnackBar(SnackBar(
//                              content: Text('user not found'),
//                            ));
                            print("user not found");
                          } else if (e.code == 'wrong-password') {
//                            loginkey.currentState.showSnackBar(SnackBar(
//                              content: Text('wrong password'),
//                            ));
                          } else if (e.code == 'invalid-email') {
//                            loginkey.currentState.showSnackBar(SnackBar(
//                              content: Text('invalid email'),
//                            ));
                          }
                        }
                      },
                    )),
              ],
            )));
  }
}
