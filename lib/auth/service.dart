import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/auth/model.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signIn(String email, String password)
  async {
    try{
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email,
       password: password);
      var user = result.user;

      if(user == null)
      {
        return null;
      }
      return UserModel.fromFirebase(user);
    }
    catch(e){
      return null;
    }
  }

  Future<UserModel?> registrate(String email, String password)
  async {
    try{
      UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email,
       password: password);
      var user = result.user;

      if(user == null)
      {
        return null;
      }
      return UserModel.fromFirebase(user);
    }
    catch(e){
      return null;
    }
  }

  Future logOut()
  async{
    await _firebaseAuth.signOut();
  }

  Stream<UserModel?> get currentUser{
    return _firebaseAuth.authStateChanges().map(
      (User? user) => user != null ? UserModel.fromFirebase(user) : null);
  }
}