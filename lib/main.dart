import 'package:flutter/material.dart';
// import 'package:todo_bloc_app/models/task.dart';
import 'package:todo_bloc_app/screens/tasks_screen.dart';
import 'blocs/bloc_exports.dart';

void main() {
  // BlocOverrides.runZoned() used here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TasksScreen(),
      ),
    );
  }
}
