import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoomm_clone/resources/auth_methods.dart';
import 'package:zoomm_clone/screens/home_screen.dart';
import 'package:zoomm_clone/screens/login_screen.dart';
import 'package:zoomm_clone/screens/videocall_screen.dart';
import 'package:zoomm_clone/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData.dark().copyWith(
scaffoldBackgroundColor: backgroundColor,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
      routes: {
        '/login':(context)=> const LoginScreen(),
        '/home':(context)=> const HomeScreen(),
        '/videocall':(context)=>const VideoCallScreen(),
      },
    );
  }
}

