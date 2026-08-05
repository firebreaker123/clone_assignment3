import 'package:flutter/material.dart';
import '../screens/new_and_hot_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  NewAndHotScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/* import 'package:flutter/material.dart';
import '../views/todo_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}*/