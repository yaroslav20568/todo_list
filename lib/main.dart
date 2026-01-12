import 'package:flutter/material.dart';

import 'package:todo_list/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(useMaterial3: true),
      home: const TodoListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
