import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class RegisterUser extends StatefulWidget {

  final Function toggleAction;

  RegisterUser({required this.toggleAction});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> with SingleTickerProviderStateMixin{

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  final AuthService _auth = AuthService();

  // text field state
  String email = ""; //"quinny.jtd@gmail.com";
  String password = ""; //"Testflutterfire";
  String userDisplayName = ""; //"Quinny";
  int emailCharCount = 0; 
  int pwdCharCount = 0;
  String errorUserInfo = "";
  

  @override
  void initState() {
    
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds:1000),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0), end: const Offset(0, 0)
    ).animate(CurvedAnimation(
      curve: Curves.decelerate,
      parent: _controller,
      )
     );

     _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Register',
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
            label: const Text('Sign In',
            style: TextStyle(color: Colors.white)),

          )
        ]
      ),

      body: Container(
        padding: const EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key: _formKey,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //const SizedBox(height:20.0),
                
                // user display name text field
                TextFormField(
                    initialValue: 'Quinny',
                    autocorrect: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Name',
                      //counterText: emailCharCount.toString(),
                      //errorText: 'invalid email address',
                      border: OutlineInputBorder(),
                      
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter your name';
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value){
                      setState((){
                        userDisplayName = value;
                        
                      } );
                      //print(userDisplayName);
                    },
                
                  ),

                const SizedBox(height:5.0),
                // email text field
                TextFormField(
                    initialValue: 'quinny.jtd@gmail.com',
                    autocorrect: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'email address',
                      //counterText: emailCharCount.toString(),
                      //errorText: 'invalid email address',
                      border: OutlineInputBorder(),
                      
                      
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter some text';
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value){
                      setState((){
                        email = value;
                        emailCharCount = email.length;
                      } );
                      //print(email);
                    },
                
                  ),
                
                const SizedBox(height:5.0),
          
                //password text field
                TextFormField(
                    initialValue: 'Testflutterfire',
                    autocorrect: true,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password),
                      hintText: 'password',
                      counterText: '${pwdCharCount.toString()} characters',
                      //errorText: 'invalid password',
                      border: const OutlineInputBorder(),

                      
                    ),
                    validator: (value){
                      if(value ==null || value.isEmpty){
                        return 'please enter a valid pwd';
                      }else{
                        if(value.length < 6){
                          return 'pwd must be 6+ characters long';
                        }else{
                          return null;
                        }
                      }
                    },
                    onChanged: (val){
                      setState((){
                        password = val;
                        pwdCharCount = password.length;
                        
                      } );
          
                      //print(password);
                    }
                  ),
                
                const SizedBox(height:5.0),
                
                // register button
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:  MaterialStatePropertyAll<Color>(
                      Colors.amber
                    ),

                  ),
                  child: const Text(
                    'Register'
                  ),
                  onPressed:() async {
                    if(_formKey.currentState!.validate()){
                      User? result = await _auth.registerWithEmailPwd(email, password, userDisplayName);
                      
                      if(result ==null){
                        setState(()=> errorUserInfo = 'Please provide valid email/password.');
                      }else{
                        
                        await result.updateDisplayName(userDisplayName);
                        await result.reload();
                        print('${result.displayName} is updated');
                      }
                    }               
                    
                  },
                ),
          
              const SizedBox(height: 5.0),

              Text(
                errorUserInfo,
                style: const TextStyle(color: Colors.red, fontSize: 16.0),
              )

              ],
            ),
          ),
        ),
      ),


    );

  }
}