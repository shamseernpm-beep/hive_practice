import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("students");
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "practice",
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
