import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {

  final Function toggleAction;

  RegisterUser({required this.toggleAction});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form
  final GlobalKey  _formKey = GlobalKey<FormState>();

  // text field state
  String email = "";
  String password = "";
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:20.0),
              TextFormField(
                autocorrect: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'email address',
                  counterText: '0 characters',
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
                  setState(()=> email = value);
                  print(email);
                },


              ),
              const SizedBox(height:20.0),
              TextFormField(
                autocorrect: true,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'password',
                  counterText: '0 characters',
                  border: OutlineInputBorder(),
                  
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
                  setState(()=> password = val);
                  print(password);
                }
              ),

            ],
          ),
        ),
      ),

    );

  }
}