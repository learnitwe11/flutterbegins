import 'package:flutter/material.dart';
import 'package:flutterbegins/services/auth_service.dart';

class SignIn extends StatefulWidget {
  final Function toggleAction;

  SignIn({required this.toggleAction});
  
  
  @override
  State<SignIn> createState() => _SignInState();
}



class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: const Text(
          'Sign In',
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
            label: const Text('Register',
            style: TextStyle(color: Colors.white)
            ),

          )
        ]
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20.0,),
          TextButton.icon(
            icon: const Icon(Icons.person_2_sharp),
            onPressed:() async {
              dynamic result = await _auth.signInAnonymously();
              if (result == null){
                print('error signing in.');
              }else{
                print('signed in');
                print(result);
              }
              
            },
            label: const Text('Sign in anolymously.'),
          )
        ]
        
      ),
    );
  }
}