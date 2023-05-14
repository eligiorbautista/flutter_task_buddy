import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TaskBuddy());
}

class TaskBuddy extends StatelessWidget {
  const TaskBuddy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Buddy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const HomePage(),
    );
  }
}
