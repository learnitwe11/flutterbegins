import 'package:flutter/material.dart';
import 'package:flutterbegins/services/auth_service.dart';

class Home extends StatelessWidget {
  Home({super.key});

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
            label: const Text('Sign Out'),
          ),
        ],
      ),
    );
        
      
    
  }
}