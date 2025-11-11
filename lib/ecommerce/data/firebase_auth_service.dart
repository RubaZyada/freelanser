import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  //log in
 static Future< UserCredential?> login (String email, String password) async{ 
    // implement firebase login logic here
   FirebaseAuth auth = FirebaseAuth.instance;
   var credentials = await  auth.signInWithEmailAndPassword(email: email, password: password);
    return credentials;
  }
  // sign up
 static Future< UserCredential?> signup(String email, String password) async{ 
    // implement firebase signup logic here
   FirebaseAuth auth = FirebaseAuth.instance;
   var credentials = await  auth.createUserWithEmailAndPassword(email: email, password: password);
    return credentials;
  }
//sign out in build appbar
static Future <void> logout()async{
  FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();

}

}