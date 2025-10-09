import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  const Todo({super.key,
   required this.task
  });

  final String task;

  @override
  Widget build(BuildContext context) {
    return Text(task);
    

  }
}