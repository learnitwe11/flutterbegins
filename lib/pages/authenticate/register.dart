import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {

  final Function toggleAction;

  RegisterUser({required this.toggleAction});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Register',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.white,
            fontFamily: 'IndieFlower',

          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            onPressed: ()=> widget.toggleAction(),
            label: const Text('Sign In',
            style: TextStyle(color: Colors.white)),

          )
        ]
      )
      //body: Column(

    );

  }
}