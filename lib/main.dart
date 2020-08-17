import 'package:doken/models/user.dart';
import 'package:doken/screens/wrapper.dart';
import 'package:doken/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doken/screens/display_doctor.dart';
import 'package:doken/screens/display_patient.dart';
import 'package:doken/screens/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          routes: {
            //'/': (context) => Wrapper(),
            '/': (context) => Intro(),
            '/display_doctor': (context) => DisplayDoctor(),
            '/display_patient': (context) => DisplayPatient(),
          },)
    )
); // MaterialApp
}
