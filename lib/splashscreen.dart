import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_aibad/screens/chat_screen.dart';
class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ChatScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Color(0xFFFFFFFF),Color(0xFFFFFFFF),]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(height: 60,),
                Image.asset(
                  "assets/logo.png",
                  height: 80.0,
                  width: 150.0,
                ),
                Text("Let’s find Quote maker the \n best for you about Agile.",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                Image.asset(
                  "assets/illustrasi.png",
                  height: 400.0,
                  width: 400.0,
                ),
              ],
            ),

            CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}