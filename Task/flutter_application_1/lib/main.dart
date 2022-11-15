import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class cardpicture extends StatelessWidget {
  cardpicture({this.onTap, this.imagepath});
 
 final Function()? onTap;
 final String? imagepath;

 @override
 Widget build(BuildContext context) {
  final Size= MediaQuery.of()
   context.size;

   if(imagepath!=null) {
    return card(
      child:Container(
        height: 300,
        padding: EdgeInsets.all(100),
        width: Size.width*70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          image: DecorationImage(
            fit: BoxFit.cover,image: (FileImage(file(imagepath as String))),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                    boxShadow: (
                      Color:null,
                      offset:offset(3.0,3.0),
                      bluRadius=2.0,

                      child:IconButton(
                        onpressed:() {
                          print('icon press');
                        }, icon:Icon(Icons.delete,color:colors.white)),
                      )
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      )
    )
   }
 }
