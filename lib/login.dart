import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:practice_hive/screen.dart';

class Login extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("form")),
          SizedBox(height: 100),
          TextField(
            controller: username,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name",
            ),
          ),
          SizedBox(height: 30),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your age",
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              Map<String, dynamic> student = {
                "name": username.text,
                "age": int.tryParse(ageController.text) ?? 0,
              };
              final box = Hive.box("students");
              await box.add(student);
              if (mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen()),
                );
              }
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
