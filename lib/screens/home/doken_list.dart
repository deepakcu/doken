import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:doken/screens/home/doken_list.dart';
import 'package:doken/models/doken.dart';
import 'package:doken/screens/home/doken_tile.dart';

class DokenList extends StatefulWidget {
  @override
  _DokenListState createState() => _DokenListState();
}

class _DokenListState extends State<DokenList> {
  @override
  Widget build(BuildContext context) {
    final dokens = Provider.of<List<Doken>>(context) ?? [];
    dokens.forEach((doken) {
      print (doken.clinic);
      print (doken.curToken);
      print (doken.lastToken);
    });

    return ListView.builder(
        itemCount: dokens.length,
        itemBuilder: (context, index){
          return DokenTile(doken: dokens[index]);
        },
    );
  }
}


