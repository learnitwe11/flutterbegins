import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterbegins/pages/authenticate/authenticate.dart';
import 'package:flutterbegins/pages/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  

  @override
  Widget build(BuildContext context) {
    final dynamic result = Provider.of<User?>(context);
    if (result == null){
      return const Authenticate();
    }else{
      return Home();
    }
    //Home();
  }
}