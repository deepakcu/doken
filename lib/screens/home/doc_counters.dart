import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doken/models/user.dart';
import 'package:doken/services/database.dart';

class DocCounters extends StatefulWidget {
  @override
  _DocCountersState createState() => _DocCountersState();
}

class _DocCountersState extends State<DocCounters> {

  // form values
  String _clinic;
  int _curToken;
  int _lastToken;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData data = snapshot.data;
          print(data.clinic);
          print(data.curToken);
          print(data.lastToken);

          //return Text("Loaded");
          return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Center(
                      child: Card(
                        color: Colors.brown[400],
                        child: InkWell(
                          //splashColor: Colors.lightBlueAccent[100],
                          onTap: () async {
                            print('check-in.');
                            await DatabaseService(uid: user.uid).updateUserData(
                                _clinic ?? snapshot.data.clinic,
                                0,
                                0
                            );
                            //Navigator.pushNamed(context, '/display_patient');
                            //return Home();
                          },

                          child: Container(
                            width: 300,
                            height: 100,
                            child:
                            Center(
                              child: Text('Reset', style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,

                              ), textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Card(
                        color: Colors.brown[400],
                        child: InkWell(
                          //splashColor: Colors.lightBlueAccent[100],
                          onTap: () async {
                            print('check-in.');
                            await DatabaseService(uid: user.uid).updateUserData(
                                _clinic ?? snapshot.data.clinic,
                                _curToken ?? snapshot.data.curToken,
                                _lastToken ?? snapshot.data.lastToken+1
                            );
                            //Navigator.pushNamed(context, '/display_patient');
                            //return Home();
                          },

                          child: Container(
                            width: 300,
                            height: 100,
                            child:
                            Center(
                              child: Text('Check-in patient', style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,

                              ), textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Card(
                        color: Colors.brown[400],
                        child: InkWell(
                          //splashColor: Colors.lightBlueAccent[100],
                          onTap: () async {
                            print('check-out');
                            await DatabaseService(uid: user.uid).updateUserData(
                                _clinic ?? snapshot.data.clinic,
                                _curToken ?? snapshot.data.curToken+1,
                                _lastToken ?? snapshot.data.lastToken
                            );
                            //Navigator.pushNamed(context, '/display_patient');
                            //return Home();
                          },

                          child: Container(
                            width: 300,
                            height: 100,
                            child:
                            Center(
                              child: Text('Check-out patient', style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,

                              ), textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Next patient token: '+snapshot.data.curToken.toString(),
                      style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Remaining patients: '+(snapshot.data.lastToken - snapshot.data.curToken).toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
              )
          );
        } else {
          print('loading');
          return Text("Loading");
        }
      }
    );
  }
}
