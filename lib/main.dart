import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");

  await Future.delayed(const Duration(seconds: 2));
  runApp(const TaskBuddy());
}

class TaskBuddy extends StatelessWidget {
  const TaskBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Task Buddy",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
