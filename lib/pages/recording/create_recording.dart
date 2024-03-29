import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:flutterbegins/services/record_service.dart';

import '../../services/auth_service.dart';

class CreateRecording extends StatefulWidget {
  
  const CreateRecording({super.key});

  @override
  State<CreateRecording> createState() => _CreateRecordingState();
}

class _CreateRecordingState extends State<CreateRecording> {

  final AuthService _auth = AuthService();
  final RecordService _audioRecorder = RecordService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map userData = {};

  // text field
  String titleText = '';
  String fileSavingPath = '';
  String user = '';

  @override
  Widget build(BuildContext context) {

    userData = ModalRoute.of(context)?.settings.arguments as Map;
    user = userData["user"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'New recording by $user',
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 4.0,
            color: Colors.white,

          )
        ),
        centerTitle: true,
        // actions:<Widget>[
        //   TextButton.icon(
        //     icon: const Icon(Icons.person),
        //     onPressed: ()async{
        //       await _auth.signOut();
        //     },
        //     label: const Text(
        //       'Sign Out',
        //       style: TextStyle(
        //         color: Colors.white,
        //       )
        //     ),

        //   ),

        // ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal:40.0, vertical:10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                ),
                decoration: const InputDecoration(
                  labelText: 'Title',
                  icon: Icon(Icons.subtitles_outlined),
                  hintText: 'A unique title is needed',
                  border: OutlineInputBorder(),

                ),
                validator:(value){
                  if(value == null || value.isEmpty){
                    return 'Please enter a title for this audio clip';
                    
                  }else{
                    setState(()=>titleText = value);
                    return null;
                  }
                }
              ),
              const SizedBox(height: 10.0),

              // record button 
              IconButton(
                onPressed: () async {
                  
                  _audioRecorder.startRecording(user, titleText);
                },
                icon: const Icon(Icons.mic),
                color:Colors.red,

              ),
              // 
            ],
          )
        )
          
      
        ),
    

    );
  }
}