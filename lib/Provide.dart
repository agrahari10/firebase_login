import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProviderState extends ChangeNotifier {


  String _uid;
  String _Email;

  String get getUid => _uid;

  String get getEmail => _Email;

  final GoogleSignIn googleSignIn = GoogleSignIn();


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {
    bool succes = false;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      if (userCredential != null) {
        _uid = userCredential.user.uid;
        _Email = userCredential.user.email;
        succes = true;
      }
    } catch (e) {

    }
    return succes;
  }

  Future<bool> LoginUser(String email, String Password) async {
    bool succes = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);
      if (userCredential != null) {
        _uid = userCredential.user.uid;
        _Email = userCredential.user.email;
        succes = true;
      }
    } catch (e) {

    }
    return succes;
  }

  void signOut() async {
    await _auth.signOut();
  }



Future <bool> googlesignIn() async {
  bool success = false;
  try {
    final user = await googleSignIn.signIn();
    if (user != null) {
      GoogleSignInAuthentication googleSignInAuthentication = await user
          .authentication;
      print('ddd'* 50);
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );
      UserCredential userCredential = await _auth.signInWithCredential(
            credential);
        success = true;

      }
      // else{
      //   print('error');
      //
      // }
    }
    catch (e) {
      print('google sign in error');
      print('*' * 50);
      print(e);
    }
    return success;
  }
}








