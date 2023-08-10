import 'package:flutter/material.dart';
// import 'package:todo_bloc_app/blocs/form_bloc/bloc/form_bloc_event.dart';
// import 'package:todo_bloc_app/models/task.dart';
import 'package:todo_bloc_app/screens/tasks_screen.dart';
import 'package:todo_bloc_app/services/firestore_service.dart';
import 'blocs/bloc_exports.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // BlocOverrides.runZoned() used here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(FirestoreService())..add(const LoadTask())
        ),
        BlocProvider(
          create: (context) => FormBloc()..add(const InitEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const TasksScreen(),
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   return MultiBlocProvider(
//     providers: [
//       BlocProvider(
//         create: (context) => TaskBloc(),
//       ),
//       BlocProvider(
//         create: (context) => FormBloc()..add(const InitEvent()),
//       ),
//     ],
//     child: MaterialApp(
//       title: 'Todo App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const TasksScreen(),
//     ),
//   );
// }
