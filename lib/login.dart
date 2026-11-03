import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Last extends StatefulWidget {
  const Last({super.key});

  @override
  State<Last> createState() => _LastState();
}

class _LastState extends State<Last> {
  late Box studentBox;

  @override
  void initState() {
    super.initState();
    studentBox = Hive.box("students");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: studentBox.listenable(),
              builder: (context, box, child) {
                final students = box.values.toList();

                if (students.isEmpty) {
                  return Center(child: Text("no student"));
                }
                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];

                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("${student['name']}"),
                        subtitle: Text("${student['age']}"),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
