import 'package:flutter/material.dart';
import 'package:task_buddy/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add a new task"),
      backgroundColor: Color.fromARGB(255, 235, 232, 232),
      content: SizedBox(
        height: 150,
        child: Column(children: [
          // get user input
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
              child: TextField(
                maxLength: 24,
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Enter a task",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // buttons => save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(
                width: 10,
              ),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          ),
        ]),
      ),
    );
  }
}
