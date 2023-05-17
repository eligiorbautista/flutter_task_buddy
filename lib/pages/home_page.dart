import 'package:flutter/material.dart';
import 'package:task_buddy/database/database.dart';
import 'package:task_buddy/util/dialog_box.dart';
import 'package:task_buddy/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _mybox = Hive.openBox("mybox");
  ToDoDatabase db = ToDoDatabase();

  // text controller - for us to access the textfield outside the dialog
  final _controller = TextEditingController();

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      // ! means the opposite of the current value ex(true to false or false to true)
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () {
                _controller.clear();
                Navigator.of(context).pop();
              });
        });
  }

  void showAbout() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Flexible(
                child: Text(
                    "Introducing Task Buddy, a user-friendly mobile application that makes your life easier. With Task Buddy's simple and straightforward layout, you can easily manage your to-do list, maintain organization, and increase productivity. Say good-bye to time-consuming duties and hello to a more streamlined and effective approach.")),
            elevation: 10,
            scrollable: true,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  showAbout();
                },
                icon: const Icon(
                  Icons.info_rounded,
                  size: 22,
                )),
          )
        ],
        title: Image.asset(
          "assets/icons/png/logo-no-background.png",
          width: 135,
        ),
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        centerTitle: true,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
