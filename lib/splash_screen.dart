import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirole_base_app/home_screen.dart';
// import 'package:multirole_base_app/home_screen.dart';
import 'package:multirole_base_app/login_screen.dart';
import 'package:multirole_base_app/student_screen.dart';
import 'package:multirole_base_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    // since the value is not null it should be either true or false if it's null then make it false;

    String dropDownValue = sp.getString('dropDownValue') ?? '';

    if (isLogin) {
      if(dropDownValue.toString() == 'Student'){
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      }
      else if(dropDownValue.toString() == 'Teacher'){
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TeacherScreen()));
        });
      }
      else{
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              'https://images.pexels.com/photos/3338681/pexels-photo-3338681.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')),
    );
  }
}
