import 'package:doken/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:doken/shared/constants.dart';
import 'package:doken/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            title: Text('Sign in to Doken'),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Register')),
            ]),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration:
                        textInputDecoration.copyWith(hintText: 'Email'),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter a password' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.brown[400],
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        print(email);
                        print(password);
                        if(_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          print(email);
                          print(password);
                          dynamic result = await _auth.signInWithEmailAndPassword(email.trim(), password.trim());
                          if ( result == null ) {
                            setState(() {
                              error = "Could not sign in. Have you registered?";
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                    Text(error, style: TextStyle(color:Colors.red, fontSize:14.0),),
                  ],
                ))));
  }
}
