import 'package:flutter/material.dart';
import 'package:task_buddy/util/dialog_box.dart';
import 'package:task_buddy/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of to do task
  List toDoList = [
    ["First", false],
    ["Second", false]
  ];

  // checkbox tapped
  checkBoxChanged(bool? value, int index) {
    setState(() {
      // ! means the opposite of the current value ex(true to false or false to true)
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // create new task
  createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
