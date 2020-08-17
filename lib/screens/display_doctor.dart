import 'package:flutter/material.dart';
import 'package:doken/models/user.dart';
import 'package:doken/screens/authenticate/authenticate.dart';
import 'package:doken/screens/home/home_doctor.dart';
import 'package:provider/provider.dart';

class DisplayDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('DisplayDoctor user is ');
    print(user);

    // return home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomeDoctor();
    }
  }
}
