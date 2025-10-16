import 'package:flutter/material.dart';
import 'package:todos/task.dart';

class Todo extends StatefulWidget {
  const Todo({
    super.key,
    required this.task, 
    required this.checkboxOnClick, 
  });

  final Task task;
  final void Function(bool? value, Task task) checkboxOnClick;

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool isCompleted = false;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: widget.task.isCompleted, onChanged: (value) {
          widget.checkboxOnClick(value, widget.task);
        },),
        Text(widget.task.name),
      ]
    );
  }
}
