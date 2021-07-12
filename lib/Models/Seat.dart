import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/data.dart';


class CienmaSeat extends StatefulWidget {
  String number;
  bool isReserved;
  bool isSelected;


  CienmaSeat(this.number,this.isReserved,this.isSelected);

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
  bool seatExist(String num){
    bool exist=false;
    for(int i=0;i<Selected.length;i++){
      if(Selected[i]==num){
        exist= false;
      }else{
        exist= true;
      }
    }
    return exist;
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          if(!widget.isReserved){
            if(widget.isSelected==true){
              Selected.remove(widget.number);
              widget.isSelected=!widget.isSelected;
            }
            else{
              widget.isSelected=!widget.isSelected;
              if(!Selected.contains(widget.number)){
                Selected=Selected+[widget.number];
              }
            }
          }
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery
              .of(context)
              .size
              .width / 15,
          height: MediaQuery
              .of(context)
              .size
              .width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Colors.yellow
                  : widget.isReserved ? Colors.red : Colors.white,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color: Colors.red, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
