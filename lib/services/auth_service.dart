import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  // Firebase auth instance
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user{
    return _auth.authStateChanges();
  }

  // sign in anonymously
  Future signInAnonymously() async
  {
    try{
      UserCredential result = await _auth.signInAnonymously();
          return result.user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
    
  }


  // sign out
  Future signOut() async{
    try{
      await _auth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}