import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter/foundation.dart';

class RecordService{
  int _recordDuration = 0;
  Timer? _timer;
  RecordState _recordState = RecordState.stop;
  final Record _audioRecorder = Record();

  // start recording
  Future<void> startRecording(String user, String titleText) async{
    
    
      final Directory appDocuments = await getApplicationDocumentsDirectory();
      //final Directory? downloadsDirectory = await getDownloadsDirectory();
      String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      final String fileName = '$user-$timeStamp.m4a';
      final String fileSavingPath = '${appDocuments.path}/$fileName';
      final File tempFile = File('${appDocuments.path}/$user.txt');
      
      try {
        // if(await _audioRecorder.hasPermission()){
        //   await _audioRecorder.start(
        //     path:fileSavingPath,
        //     encoder: AudioEncoder.aacLc,
        //     bitRate: 128000,
        //     samplingRate: 44100,
        // );
        
          //}
          await tempFile.writeAsString(titleText);
          print (appDocuments.list());
      } catch (e) {
        print(e);
      }
      

      //bool isRecording = await _audioRecorder.isRecording();
    }
  
  
}