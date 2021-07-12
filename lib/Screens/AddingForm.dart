import 'dart:io';
import 'dart:math';

import 'package:cinema_app/Screens/Home/appBar.dart';
import 'package:cinema_app/Screens/ListMoviesF.dart';
//import 'package:cinema_app/Widgets/movie_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:path/path.dart';

class AddingMovieForm extends StatefulWidget {
  @override
  _AddingMovieFormState createState() => _AddingMovieFormState();
}

class _AddingMovieFormState extends State<AddingMovieForm> {
  File _userImageFile;
  String name;
  String story;
  String rate;
  String category;
  String year;
  String quality;
  String imgurl;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future getimage () async{
      var image= await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _userImageFile=image;
        print(_userImageFile);
      });
    }
    Future captureimage () async{
      var image= await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _userImageFile=image;
        print(_userImageFile);
      });
    }
    Future uploadFile() async {
      Reference storageReference = FirebaseStorage.instance.ref().child(basename(_userImageFile.path));
      UploadTask uploadTask = storageReference.putFile(_userImageFile);
      await uploadTask.whenComplete((){
        print('File Uploaded');
        storageReference.getDownloadURL().then((fileURL) {
          setState(() {
            imgurl = fileURL;
            print(imgurl);
          });
        });
      });
    }

    Future Make_movie(String imgurl2) async{
      DocumentReference ref = await FirebaseFirestore.instance
          .collection('Movies').add({
        'name': name,
        'Category': category,
        'Story': story,
        'Rate': rate,
        'imageurl':imgurl2,
        'year':year,
        'quality':quality
      });
      // Firestore.instance
      //     .collection('Seats')
      //     .document(ref.id)
      //     .setData(
      //   {
      //     's1': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's2': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's3': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's4': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's5': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's6': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's7': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's8': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's9': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's10': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's11': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's12': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's13': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's14': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's15': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's16': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's17': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's18': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's19': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's20': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's21': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's22': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's23': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's24': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's25': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's26': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's27': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's28': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's29': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's30': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's31': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's32': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's33': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's34': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's35': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's36': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's37': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's38': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's39': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's40': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's41': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's42': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's43': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's44': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's45': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's46': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //     's47': {
      //       'isReserved': false,
      //       'isSelected': false,
      //     },
      //   },
      // );
      print('movie added');
    }
    return Scaffold(
      appBar: mainbar("Add Movie"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.movie,
                    color: Colors.red,
                  ),
                  hintText: 'Enter your movie name',
                  labelText: 'Movie Name',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter movie name';
                  }
                  return null;
                },
                onChanged: (value) {
                  this.name = value;
                },
              ),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.red,
                    child: (_userImageFile!=null)?Row(children: <Widget>[
                      Image.file(_userImageFile,width: 70,height: 70,),
                      SizedBox(width: 20,),
                      Text("Change Image",style: TextStyle(color: Colors.white,fontSize: 20)),
                    ],):Text("Choose image",style: TextStyle(color: Colors.white,fontSize: 20),),
                    onPressed: (){
                      getimage();
                    },
                  ),
                  IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.camera_enhance),
                    onPressed: (){
                      captureimage();
                    },
                  )
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.movie_filter,
                    color: Colors.red,
                  ),
                  hintText: 'Enter Movie Category',
                  labelText: 'Category',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter movie Category';
                  }
                  return null;
                },
                onChanged: (value) {
                  this.category = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.description,
                    color: Colors.red,
                  ),
                  hintText: 'Enter Movie description',
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter movie description';
                  }
                  return null;
                },
                onChanged: (value) {
                  this.story = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.rate_review,
                    color: Colors.red,
                  ),
                  hintText: 'Enter Movie rate',
                  labelText: 'Rate',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter movie rate';
                  }
                  return null;
                },
                onChanged: (value) {
                  this.rate = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.calendar_today,
                    color: Colors.red,
                  ),
                  hintText: 'Enter Movie Year',
                  labelText: 'Year',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter movie year';
                  }
                  return null;
                },
                onChanged: (value) {
                  this.year = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.red,
                  ),
                  hintText: 'Enter Movie Quality',
                  labelText: 'Quality',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter movie quality';
                  }
                  return null;
                },
                onChanged: (value) {
                  this.quality = value;
                },
              ),
              Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    color: Colors.red,
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Reference storageReference = FirebaseStorage.instance.ref().child(basename(_userImageFile.path));
                      UploadTask uploadTask = storageReference.putFile(_userImageFile);
                      await uploadTask.whenComplete((){
                        print('File Uploaded');
                        storageReference.getDownloadURL().then((fileURL) {
                          setState(() {
                            imgurl = fileURL;
                            Make_movie(imgurl);
                          });
                        });
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListMoviesF(),
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

/*mixin StorageUploadTask {
}*/
