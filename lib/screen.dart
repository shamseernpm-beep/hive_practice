import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late Box StudentsBox;

  @override
  void initState() {
    super.initState();
    StudentsBox = Hive.box("students");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: StudentsBox.listenable(),
                builder: (context, box, child) {
                  final students = box.values.toList();

                  if (students.isEmpty) {
                    return Center(child: Text("no students add "));
                  }
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];

                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text('${student["name"]}'),
                          subtitle: Text('${student['age']}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
