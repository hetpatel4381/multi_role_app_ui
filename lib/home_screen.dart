import 'package:flutter/material.dart';
import 'package:multirole_base_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('Email') ?? '';
    age = sp.getString('age') ?? '';
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
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
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('age'),
                Text(age.toString()),
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
                    MaterialPageRoute(builder: (context) => LoginScreen()));
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
