import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/resources/jitsi_meet_method.dart';
import 'package:zoomm_clone/utils/colors.dart';
import 'package:zoomm_clone/widgets/meet_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods=AuthMethods();
  late TextEditingController meetingIdController;
  //created like this as we acn't do initialozation of name like this
  late TextEditingController nameController;
  final JitsiMeetMethds _jitsiMeetMethds=JitsiMeetMethds();
  bool isAudioMuted=true;
 bool  isVideoMuted=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meetingIdController=TextEditingController();
    //text is inputted as we don't want that name shows up to be empty
    //name of email displayed
   nameController=TextEditingController(text: _authMethods.user.displayName);
  }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    meetingIdController.dispose();
  }
  _joinMeeting(){
_jitsiMeetMethds.createMeeting(username: nameController.text,
    roomname: meetingIdController.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title:  Text("Join a Meeting",style: TextStyle(fontSize: 22),),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: 'Room ID',
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: 'Name',
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
        const  SizedBox(height: 10,),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 150),
              child: Text("Join",style: TextStyle(fontSize: 16),),
            ),
          ),
          const SizedBox(height: 20,),
MeetOptions(text: "Mute Audio", isMute: isAudioMuted, onChange: onAudioMuted,),
          MeetOptions(text: "Turn Off My Video", isMute: isVideoMuted, onChange: onVideoMuted,),
        ],
      ),
    );
  }
  onAudioMuted(bool val){
    setState(() {
      isAudioMuted=val;
    });
  }
  onVideoMuted(bool val){
    setState(() {
      isVideoMuted=val;
    });
  }
}
