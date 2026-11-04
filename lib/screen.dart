import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice_hive/login.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
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
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your name",
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your age",
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> student = {
                  'name': username.text,
                  'age': int.tryParse(ageController.text) ?? 0,
                };
                final box = Hive.box("students");
                await box.add(student);
                if (mounted) {
                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(builder: (context) => Last()),
                  );
                }
              },
              child: Text("submit"),
            ),
          ],
        ),
      ),
    );
  }
}
