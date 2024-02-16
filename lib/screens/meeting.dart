import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomm_clone/resources/jitsi_meet_method.dart';
import 'package:zoomm_clone/widgets/home_meeting_button.dart';

class Meeting extends StatelessWidget {
   Meeting({Key? key}) : super(key: key);
final JitsiMeetMethds _jitsiMeetMethds=JitsiMeetMethds();
  createNewMeeting()async{
    var random=Random();
    String roomname=(random.nextInt(100000000)+10000000).toString();
_jitsiMeetMethds.createMeeting(roomname: roomname, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context,'/videocall');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetButton(onPressed: createNewMeeting,
                icon: Icons.video_camera_back, text: "New Meeting"),
            HomeMeetButton(onPressed: ()=>joinMeeting(context), icon: Icons.add_box_rounded, text: "Join Meeting"),
            HomeMeetButton(onPressed: (){}, icon: Icons.calendar_today, text: "Schedule"),
            HomeMeetButton(onPressed: (){}, icon: Icons.arrow_upward, text: "Share Screen")

          ],
        ),
        Expanded(child:
        Center(child: Text("Create/Join Meetings with just a click!",style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),)))
      ],
    );
  }
}
