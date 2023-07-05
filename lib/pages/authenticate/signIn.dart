//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutterbegins/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleAction;

  SignIn({required this.toggleAction});
  
  
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin{
  final AuthService _auth = AuthService();
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // user info
  String email = "";//"quinny.jtd@gmail.com";
  String password = "";//"Testflutterfire";
  String userName = "";
  String errorUserInfo = "";


  @override 
  void initState(){
    super.initState();
    // initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // initialize animation tween
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1, 0), end: const Offset(0, 0))
      .animate(_controller);
    
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
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
        //centerTitle: true,
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
      body: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.yellow,),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical:15, horizontal: 50),
          child: Form(
            key: _formKey,
            child: SlideTransition(
              position: _offsetAnimation,
              child: Column(
                
                children: <Widget>[
                  const SizedBox(height: 5.0,),
                  
                  // email
                  TextFormField(
                    initialValue: "quinny.jtd@gmail.com",
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "user@example.com",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val){
                      if(val == null || val.isEmpty){
                        return "please enter your email address.";
                      }else{
                        return null;
                      }
                    },
                    onChanged:(value) => setState((){
                      email = value;
                    }),
                  ),
                  
                  const SizedBox(height: 5.0,),
                    
                  // email
                  TextFormField(
                    initialValue: "Test1234",
                    obscureText: true,
                    
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: "password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val){
                      if(val == null || val.isEmpty){
                        return "please enter password to sign in.";
                      }else{
                        return null;
                      }
                    },
                    onChanged:(value) => setState((){
                      password = value;
                    }),
                  ),
                  
                  const SizedBox(height: 5.0,),
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.lime
                      ),
                    ),
                    child: const Text(
                        "Sign In",
                    ),
                    onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        User? result = await _auth.signInWithEmailPassword(email, password);
                        if(result == null){
                          setState(() {
                            errorUserInfo = "please make sure user credentials are correct.";
                          });
                        }
                      }
                      
                    },
                  ),
                    
                   Text(
                    errorUserInfo,
                    style: const TextStyle(color: Colors.red, fontSize: 16.0),
                  )
                    
                  
                ]
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}