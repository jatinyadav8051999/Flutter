import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super:key});
      
   @override 
   Widget build(BuildContext context)  {
     return MaterialApp(
       home: MyHomePage(
        debugShowCheckedModeBanner:false,
       );
   }
}

  class MyHomePage extends StatefulWidget {
     @Override
     SplashScreenState createState() => SplashScreenState();
  }
 
   class SpalshScreenState extends State<MyHomePage> {
     @override
     void initState() {
       super.initState();
       Timer(Duration(seconds: 5),
       ),
         0=> Navigator.pushReplacement(context,
           MaterialPageRoute(builder:
             (context) => HomeScreen() 
           )
         )
     );
     }

     @override               
      Widget build(BuildContext context) {
        return Container(
          color: Colors.yellow,
          child: FlutterLogo(size: MediaQuery.of(context),size.height)

        ),
      }



      class HomeScreeen extends  StatelessWidget {
         @override
         Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text('Splash Screen Example')),
          )
          
          AppBar:AppBar(title: Text('Splash Screen Example')),
          Body:Center(
            child: Text('Welcome to Home Page'),
            style:TextStyle(color: Colors.black, fontSize: 30)
          ),
        ), 
         );
         }
      } 

      




     
       
     
  
      
    
