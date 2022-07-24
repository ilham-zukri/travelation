import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  static final FirebaseAuth auth = FirebaseAuth.instance;
  late String email;
  void signUpWithEmailPassword(String email, String password) async{
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  void logInWithEmailPassword(String email, String password) async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void setEmail(String email){
    this.email = email;
  }
  // void logOutWithEmailPassword(String email, String password) async{
  //   await auth.signOut();
  // }
}