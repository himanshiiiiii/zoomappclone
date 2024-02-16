import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/screens/home_screen.dart';
import 'package:zoomm_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          const SizedBox(
            height: 80,
          ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text("Start or join a meeting",style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,

            ),),
          ),
        ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage("assets/vc.png"),height: 220,
            ),
          ),
          CustomButton(text: "Google Sign In",
            onPressed: ()async {

          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
bool res = await _authMethods.signInWithGoogle(context);
if(res){
  Navigator.pushNamed(context, '/home');
}


          },)
        ],
      ),
    );
  }
}
