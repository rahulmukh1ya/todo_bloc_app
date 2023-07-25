import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  void _addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: AddTaskScreen()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Tasks App"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
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
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}


