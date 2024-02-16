import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoomm_clone/utils/utils.dart';

class AuthMethods{
  final FirebaseAuth  _auth=FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
Future<bool> signInWithGoogle(BuildContext context) async{
  bool res=false;
    try{
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
//acess token from here
      final GoogleSignInAuthentication? googleAuth =await googleuser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken:googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
      await _auth.signInWithCredential(credential);


      //above this is enough to show on firebase auth
      //but we also have to show data on firestore in order to fetch no of people in meeting and etc
      User? user = userCredential.user;

      if (user != null) {
        //if user is a new user and has entered right now
        //store the details on firestore
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
res= false;
    }
    return res;
  }
  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}