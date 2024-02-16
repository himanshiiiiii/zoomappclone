import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/screens/history_meeting.dart';
import 'package:zoomm_clone/screens/meeting.dart';
import 'package:zoomm_clone/utils/colors.dart';
import 'package:zoomm_clone/widgets/custom_button.dart';
import 'package:zoomm_clone/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int _page=0;
  onPageChanged(int page){
setState(() {
  _page=page;
});
  }
final AuthMethods _authMethods=AuthMethods();
  List<Widget> pages=[
  Meeting(),
    const HistoryMeeting(),
    const Text("Contacts"),
    CustomButton(text: 'Log Out', onPressed:() =>AuthMethods().signOut())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meet & Chat"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page ,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank),
              label: "Meet & Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock),
              label: "Meeting"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),
              label: "Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
              label: "Settings"),

        ],
      ),
    );
  }
}
