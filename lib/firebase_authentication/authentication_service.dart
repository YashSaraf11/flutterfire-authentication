import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService with ChangeNotifier {
  User _user;
  User get user => _user;

  //Function to monitor the state changes and notify the listeners;
  void stateChanged(User user) {
    this._user = user;
    notifyListeners();
  }

  //Functions to signIn and signUp with email and password
  Future signUpWithEmailPassword(String email, String password) async {
    try {
      _user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.message);
    }
  }

  Future signInWithEmailPassword(String email, String password) async {
    try {
      _user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.message);
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
