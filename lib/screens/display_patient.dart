import 'package:flutter/material.dart';
import 'package:doken/screens/home/home_patient.dart';

class DisplayPatient extends StatefulWidget {
  @override
  _DisplayPatientState createState() => _DisplayPatientState();
}

class _DisplayPatientState extends State<DisplayPatient> {
  int current = 0;
  int last = 0;
  @override
  Widget build(BuildContext context) {
    return HomePatient();
  }
}
