import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  // reference our box
  final _mybox = Hive.box("mybox");

  // run this method if this is the first time ever opening this app
  void createInitialData() {
    // default value
    toDoList = [
      ["This is a sample task", false],
    ];
  }

  // load the data from the database
  void loadData() {
    // This is like the table of our database
    toDoList = _mybox.get("TODOLIST");
  }

  // update the database if there are changes
  void updateDatabase() {
    // key, value
    _mybox.put("TODOLIST", toDoList);
  }
}
