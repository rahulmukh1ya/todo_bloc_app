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
        itemBuilder: (context, index) => ListTile(
          title: Text(taskList[index].title),
          trailing: Checkbox(
            value: taskList[index].isDone,
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
