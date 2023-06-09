import 'package:flutter/material.dart';
import 'package:flutterbegins/pages/wrapper.dart';
import 'package:flutterbegins/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/recording/create_recording.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This is the root widget of the app∞
  final String appTitle = 'FlutterBegins';
  final ThemeData _themeData = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    canvasColor: Colors.white,

    fontFamily: 'IndieFlower',
    platform: TargetPlatform.android,
    
    // Define the default 'TextTheme'. Use this to specify the default
    // text styling for headlines, titles, bodies of texts, and more
    // textTheme: const TextTheme(
    //   bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    //   titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    //   displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    //   )
  );
  
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      initialData: null,
      //value: AuthService().userAuthed,
      value: AuthService().userChanged,
      child: MaterialApp(
        routes:{
          '/createrecording':(context) => CreateRecording(),
        },
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: _themeData,
        home: const Wrapper(),
      ),
    );
  }
}
  