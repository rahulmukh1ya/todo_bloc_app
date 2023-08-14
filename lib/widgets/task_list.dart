import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    // final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);

    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Card(
                    color: Colors.red[100],
                    shadowColor: Colors.grey[200],
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                taskList[index].title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('Name: '),
                              Text(
                                taskList[index].name,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('Email: '),
                              Text(
                                taskList[index].email,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('Date: '),
                              Text(
                                taskList[index].dateTime.toDate().toString(),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('Message: '),
                              Text(
                                taskList[index].message,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Checkbox(
                                  value: taskList[index].isCompleted,
                                  onChanged: (val) {}),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit_square)),
                              IconButton(
                                  onPressed: () {
                                    if (state is TaskLoaded) {
                                      BlocProvider.of<TaskBloc>(context).add(
                                          DeleteTask(
                                              taskId: taskList[index].id));
                                      // BlocProvider.of<TaskBloc>(context).add(
                                      //     const LoadTask());
                                    }
                                  },
                                  icon: const Icon(Icons.delete)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}



/*

Expanded(
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
                  Text(taskList[index].dateTime.toDate().toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
 */