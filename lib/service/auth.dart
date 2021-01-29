import 'dart:async';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sudoku/models/users.dart';
import 'package:sudoku/service/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
// all firebase things happens in this page
  //create user  object based on firebaseUser
  UserK _userFromFirebaseUser (User user){
    return user != null ? UserK(uid: user.uid) :null ;
  }

  Stream<UserK> get user{
    return _auth.authStateChanges()
        //.map(firebaseuser=>User  user)=_userFromFirebaseUser(user));
    .map(_userFromFirebaseUser );
  }



  // sign in with ano
  Future signInAnon() async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;//firebaseUser
      return _userFromFirebaseUser(user);

    }
    catch(e){
      print(e.toString());
      return null;

    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
      User user = result.user;//firebase user
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;

    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
      User user = result.user;//firebase user


      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('0', 'new member', 100);

      return _userFromFirebaseUser(user);


    } catch(e){
      print(e.toString());
      return null;

    }
  }

  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;

    }

  }

}