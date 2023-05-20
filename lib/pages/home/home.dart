import 'package:flutter/material.dart';
import 'package:flutterbegins/services/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

//import '../../models/user.dart';

class Home extends StatelessWidget {
  late String userName = "?";
  Home({super.key, required this.userName});
  //Home({super.key});

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Welcome',
          style:TextStyle(
            fontFamily: 'IndieFlower',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
            color: Colors.pink,
          )
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            
            icon: const Icon(Icons.person),
            onPressed: () async{
              await _auth.signOut();
            },
            label: const Text(
              'Sign Out',
              style:TextStyle(
                color:Colors.white,
              )
            ),
            style:TextButton.styleFrom(
              foregroundColor: Colors.white,
            )
          ),
        ],
      ),
      body: Text(
        'Welcome $userName',
      )
    );
        
      
    
  }
}