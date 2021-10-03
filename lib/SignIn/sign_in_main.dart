import 'package:flutter/material.dart';
import 'package:trying/SignIn/sign_in_body.dart';

class SignInMain extends StatefulWidget {
  @override
  _SignInMainState createState() => _SignInMainState();
}

class _SignInMainState extends State<SignInMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Sign In", style: TextStyle(color: Colors.black),),
      ),
      body: SignInBody(),
    );
  }
}
