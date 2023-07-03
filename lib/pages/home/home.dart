import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbegins/services/auth_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';

//import '../../models/user.dart';

class Home extends StatefulWidget {
  late String userName = "?";

  Home({super.key, required this.userName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String fileSavingPath = "Android.";

  //Home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Welcome',
          style:TextStyle(
            fontFamily: 'IndieFlower',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
            color: Colors.limeAccent,
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
      body: Column(
        children: [
          Text(
            'Welcome ${widget.userName}',

            
          ),
          const SizedBox(height:6.0),
          Text(
            'File can be saved at $fileSavingPath',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Start recording',
        onPressed: ()async{
          final Directory appDocuments = await getApplicationDocumentsDirectory();
          

          int timestamp = DateTime.now().millisecondsSinceEpoch;
          String recordFilename = 'savedRecording-$timestamp.m4a';
          //fileSavingPath = ;
          setState(()=> fileSavingPath = appDocuments.path.toString() + "/${recordFilename}");
          final record = Record();
          // check and request permission
          if(await record.hasPermission()){
            print("permission allowed");
            // start recording
            // await record.start(
            //   path:''
            // )
          }
        },
        backgroundColor: Colors.green,
        hoverColor: Colors.amber,
        child: const Icon(Icons.mic),
      ),
    );
        
      
    
  }
}