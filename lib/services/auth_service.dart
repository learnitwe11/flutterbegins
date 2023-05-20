import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  // Firebase auth instance
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get userAuthed{
    return _auth.authStateChanges();
  }

  Stream<User?> get userChanged{
    return _auth.userChanges();
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

  // register with email and pwd
  Future registerWithEmailPwd(String email, String password, String userName) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //await result.user?.updateDisplayName(userName);
      return result.user;
    } on FirebaseException catch (e) {
      if(e.code == 'weak-password'){
        print('The password provided is too weak.');
      }else if(e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
      return null;
    } catch(e){
      print(e);
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