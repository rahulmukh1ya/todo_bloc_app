// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  void addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Center(child: AddTaskScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TaskLoaded) {
          List<Task> taskList = state.tasks;
          return Scaffold(
            appBar: AppBar(
              title: const Text("Todo App"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Chip(
                    label: Text('Tasks'),
                  ),
                ),
                TaskList(taskList: taskList)
              ],
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    // final data = await FirebaseFirestore.instance
                    //     .collection('tasks')
                    //     .snapshots()
                    //     .map(
                    //   (snapshot) {
                    //     snapshot.docs.map(
                    //       (doc) {
                    //         Map<String, dynamic> data = doc.data(); //here
                    //         print(data);
                    //       },
                    //     );
                    //   },
                    // ).toList();
                    // print(data);
                  },
                  tooltip: 'Fetch Data',
                  child: const Icon(Icons.cloud_circle),
                ),
                const SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                  onPressed: () => addTask(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          );
        } else if (state is TaskOperationSuccess) {
          taskBloc.add(const LoadTask());
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(state.errorMessage)));

          return SizedBox(child: Center(child: Text(state.message)));
        } else if (state is TaskError) {
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          return Scaffold(
            body: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else {
          return const SizedBox(
            child: Center(
              child: Text('Something went wrong'),
            ),
          );
        }
      },
    );
  }
}
