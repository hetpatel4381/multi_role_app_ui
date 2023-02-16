import 'package:flutter/material.dart';
// import 'package:multirole_base_app/home_screen.dart';
import 'package:multirole_base_app/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const List<String> list = <String>['Student', 'Teacher', 'Home' ];

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();
  String dropDownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('SignUp')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: dropDownValue,
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              icon: const Icon(Icons.arrow_drop_down_circle),
              onChanged: (value) {
                setState(() {
                  dropDownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'age',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.setString('Email', _emailController.text.toString());
                sp.setString('age', _ageController.text.toString());

                sp.setString(dropDownValue, 'Student');

                sp.setBool('isLogin', true);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                height: 50,
                width: double.infinity,
                child: const Center(
                  child: Text('SignUp'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
