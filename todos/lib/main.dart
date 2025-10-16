import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos/sharedState.dart';
import 'package:todos/task.dart';
import 'package:todos/todo.dart';

Future<void> main() async {
  final prefs =
      await SharedPreferences.getInstance();
  var tasks = [
    Task(name: 'a'),
    Task(name: 'b'),
    Task(name: 'c'),
  ];
  var count =
      prefs.getInt("count") ?? 10;
  for (int i = 0; i < 1000; ++i) {
    tasks.add(Task(name: i.toString()));
  }

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

class ChangeCount extends StatelessWidget {
  const ChangeCount({super.key});
  
  final textController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Row(
          children: [
            TextField(
              controller:
                  textController,
              keyboardType:
                  TextInputType.number,
              inputFormatters:
                  <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly,
                  ],
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(),
                hintText:
                    'Enter a search term',
              ),
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                setState(() async {
                  final prefs =
                      await SharedPreferences.getInstance();
                  var count = int.parse(
                    textController.text,
                  );
                  prefs.setInt(
                    "count",
                    count,
                  );
                  tasks.clear();
                  for (
                    int i = 0;
                    i < count;
                    ++i
                  ) {
                    tasks.add(
                      Task(
                        name: i
                            .toString(),
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final tasks = SharedState.of(
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
        body: 
        // ListView.builder(
        //   key: const Key(
        //     'long_list',
        //   ),
        //   shrinkWrap: true,
        //   itemCount: tasks.length,
        //   itemBuilder:
        //       (context, index) {
        //         return Todo(
        //           task:
        //               tasks[index],
        //         );
        //       },
        // ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
