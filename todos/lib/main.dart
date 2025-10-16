import 'package:flutter/material.dart';
import 'package:todos/sharedState.dart';
import 'package:todos/task.dart';
import 'package:todos/todo.dart';

void main() {
  var tasks = [
    Task(name: 'a'),
    Task(name: 'b'),
    Task(name: 'c'),
  ];

  runApp(
    SharedState(
      tasks: tasks,
      color: Colors.green,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() =>
      _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  

  void checkboxOnClick(bool? value, Task task) {
    task.isCompleted = value!;
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = SharedState.of(
      context,
    ).tasks;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor:
              Colors.limeAccent,
          centerTitle: true,
        ),
        body: ListView.builder(
          key: const Key('long_list'),
          itemCount: tasks.length,
          itemBuilder:
              (context, index) {
                return Todo(
                  task: tasks[index],
                  checkboxOnClick: checkboxOnClick
                );
              },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
