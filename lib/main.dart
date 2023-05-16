import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box | create a database
  var box = await Hive.openBox("mybox");

  //
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
