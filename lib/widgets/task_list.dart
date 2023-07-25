import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(taskList[index].name),
              Text(taskList[index].email),
              Text(taskList[index].title),
              Text(taskList[index].message),
              Text(taskList[index].dateTime.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
