import 'package:doken/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:doken/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String clinic = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text('Sign-up for Doken'),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign in')),
            ]),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        onChanged: (val) {
                          setState(() => clinic = val);
                        },
                        validator: (val) =>
                        val.isEmpty ? 'Enter clinic name' : null,
                        decoration:
                        textInputDecoration.copyWith(hintText: 'Clinic name')),
                    SizedBox(height: 20.0),
                    TextFormField(
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email')),
                    SizedBox(height: 20.0),
                    TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        validator: (val) =>
                            val.isEmpty ? 'Enter a password' : null,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password')),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.brown[400],
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print(email);
                          print(password);
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  clinic.trim(), email.trim(), password.trim());
                          if (result == null) {
                            setState(
                                () => error = 'please supply a valid email');
                          }
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ))));
  }
}
