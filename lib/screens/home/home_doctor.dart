import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doken/screens/authenticate/authenticate.dart';
import 'package:doken/services/auth.dart';
import 'package:doken/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:doken/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doken/screens/home/doken_list.dart';
import 'package:doken/models/doken.dart';
import 'package:provider/provider.dart';
import 'package:doken/models/user.dart';
import 'package:doken/screens/home/doc_counters.dart';

class HomeDoctor extends StatefulWidget {

  @override
  _HomeDoctorState createState() => _HomeDoctorState();
}

class _HomeDoctorState extends State<HomeDoctor> {
  int current = 0;
  int last = 0;

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("User in home_doctor is ");
    print(user.uid);
    return StreamProvider<List<Doken>>.value(
      value: DatabaseService().doken,
      child: Container(
          child: Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text('Doken'),
              backgroundColor: Colors.brown[400],
              elevation:0.0,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      await _auth.signOut();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign out')
                )
              ],
            ),
            body: DocCounters(),
          )
      ),
    );
  }

}
