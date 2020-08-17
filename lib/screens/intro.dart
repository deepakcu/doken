import 'package:flutter/material.dart';
import 'package:doken/screens/home/home.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Doken'),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Card(
              color: Colors.brown[400],
              child: InkWell(
                //splashColor: Colors.lightBlueAccent[100],
                onTap: () {
                  print('Patient tapped.');
                  Navigator.pushNamed(context, '/display_patient');
                  //return Home();
                },

                child: Container(
                  width: 300,
                  height: 100,
                  child:
                  Center(
                    child: Text('I am a patient', style: new TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,

                    ), textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

          ),
          SizedBox(height: 40.0),
          Center(
            child: Card(
              color: Colors.brown[400],
              child: InkWell(
                //splashColor: Colors.lightBlueAccent[100],
                onTap: () {
                  print('Doctor tapped.');
                  Navigator.pushNamed(context, '/display_doctor');
                  //return Home();
                },

                child: Container(
                  width: 300,
                  height: 100,
                  child:
                  Center(
                    child: Text('I am a doctor', style: new TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,

                    ), textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}