import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("home"),
          backgroundColor: Colors.blue,
          centerTitle: true,
          
        ),
        body: Row(
          children: [
            
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
            OutlinedButton(onPressed: (){
            
            }, child: Text("BUTTON"))
          ],
          
        )
        ),
  routes: <String, WidgetBuilder>{
   },
);
    

  }
}