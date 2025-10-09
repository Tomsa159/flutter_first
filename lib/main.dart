import 'package:flutter/material.dart';
import 'package:flutter_application/todo.dart';
import "sharedState.dart";

void main() {
  List<String> tasks = ["a", "b"];
  for (var i = 0; i < 1000; i++) {
    tasks.add("a");
  }
  runApp(
    SharedState(
      color: Colors.green,
      tasks: tasks,
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
  @override
  Widget build(BuildContext context) {
    List<String> tasks = SharedState.of(
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
          itemBuilder: (context, index) {
            return Todo(task: tasks[index]);
          },
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
