import 'package:firebase_auth/firebase_auth.dart';
import 'package:gullak/database.dart';
import 'package:gullak/myUser.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String uid;


  Stream<myUser> get user {
    return _auth.authStateChanges().map(myUserfromfUser);
  }


//Sign In Anonymously
  Future signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();
      User fUsr = result.user;
      await DatabaseServices(uid: fUsr.uid).updateData("First User",0);
      return myUserfromfUser(fUsr);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign Up with Email and Pass
  Future signUpEmail(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User fUsr = result.user;
      await DatabaseServices(uid: fUsr.uid).updateData("First User",0);
      return myUserfromfUser(fUsr);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign In with Email and Pass
  Future signInEmail(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User fUsr = result.user;
      DatabaseServices(uid: fUsr.uid);
      return myUserfromfUser(fUsr);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

}