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
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
          // taskBloc.add(const LoadTask());
        } else if (state is TaskOperationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
          taskBloc.add(const LoadTask());
        }
      },
      builder: (context, state) {
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
                floatingActionButton: FloatingActionButton(
                  onPressed: () => addTask(context),
                  tooltip: 'Add Task',
                  child: const Icon(Icons.add),
                ),
              );
            } else {
              taskBloc.add(const LoadTask());

              return const Scaffold(
                body: Center(
                  child: Text('Something went wrong'),
                ),
              );
            }
          },
        );
      },
    );
  }
}
