import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods{
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream get meetingHistory =>  _firestore.collection('users')
      .doc(_auth.currentUser!.uid).collection('meetings').snapshots();
  Future<void> addToMeetingHistory(String meetingname) async{
    try{
      //we are storing meeting name and time of the meeting
      await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').add({
        'meetingName':meetingname,
        'createdAt':DateTime.now(),
      }).then((value){
        print("data added suceesfully");
      });
      print("Meeting added successfully");
      print("1112222");
    }
    catch(e){
      print("error:$e");
    }
  }
}