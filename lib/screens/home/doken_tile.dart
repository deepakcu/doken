import 'package:flutter/material.dart';
import 'package:doken/models/doken.dart';

class DokenTile extends StatelessWidget {
  final Doken doken;
  DokenTile({this.doken});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
            title: Text(doken.clinic),
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[50]),
              subtitle: Text('Next token: '+doken.curToken.toString()+', Remaining patients: '+(doken.lastToken - doken.curToken).toString())
        )
      )
    );
  }
}
