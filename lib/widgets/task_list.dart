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
          height: 110,
          width: 200,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text("Name: "),
                  Text(taskList[index].name),
                ],
              ),
              Row(
                children: [
                  const Text("Email: "),
                  Text(taskList[index].email),
                ],
              ),
              Row(
                children: [
                  const Text("Title: "),
                  Text(taskList[index].title),
                ],
              ),
              Row(
                children: [
                  const Text("Message: "),
                  Text(taskList[index].message),
                ],
              ),
              Row(
                children: [
                  const Text("Date Time: "),
                  Text(taskList[index].dateTime.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
