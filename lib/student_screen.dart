import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email = '', age = '', type = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('Email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('dropDownValue') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Student View')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email'),
                Text(email.toString()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('age'),
                Text(age.toString()),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('dropDownValue'),
                Text(type.toString()),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.clear();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                height: 50,
                width: double.infinity,
                child: const Center(
                  child: Text('LogOut'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
