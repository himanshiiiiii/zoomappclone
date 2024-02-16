import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/resources/firestore_methods.dart';
class  JitsiMeetMethds{
  final AuthMethods _authMethods=AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({required String roomname,required bool isAudioMuted,required bool isVideoMuted,String username=''}) async{
try{
  String name;
  //means we have created a new meeting
  if(username.isEmpty){
    name=_authMethods.user.displayName!;
  }
  //joined a meeting
 else
   {
     name=username;
   }

  var options = JitsiMeetingOptions(
userDisplayName: name,
      userEmail: _authMethods.user.email,
      userAvatarUrl: _authMethods.user.photoURL,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      roomNameOrUrl: roomname);
  await JitsiMeetWrapper.joinMeeting(options: options);
  _firestoreMethods.addToMeetingHistory(roomname);
}catch(e){
debugPrint("error:$e");
}
  }
}
