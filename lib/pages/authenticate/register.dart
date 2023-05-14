import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {

  final Function toggleAction;

  RegisterUser({required this.toggleAction});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> with SingleTickerProviderStateMixin{

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form
  final GlobalKey  _formKey = GlobalKey<FormState>();
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;


  // text field state
  String email = "";
  int emailCharCount = 0;
  String password = "";
  int pwdCharCount = 0;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:20.0),
              SlideTransition(
                position: _offsetAnimation,
                child: TextFormField(
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
              ),
              const SizedBox(height:20.0),
              SlideTransition(
                position: _offsetAnimation,

                child: TextFormField(
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
              ),

            ],
          ),
        ),
      ),

    );

  }
}