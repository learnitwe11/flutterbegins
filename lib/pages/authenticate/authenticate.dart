import 'package:flutter/material.dart';
import 'package:flutterbegins/pages/authenticate/register.dart';
import 'package:flutterbegins/pages/authenticate/signIn.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isSignIn = true;
  void toggleAction(){
    setState(() => isSignIn = !isSignIn);    
  }

  @override
  Widget build(BuildContext context) {
    if (isSignIn){
      return SignIn(toggleAction: toggleAction);
    }
    else{
      return RegisterUser(toggleAction: toggleAction);
    }
      
    
  }
}