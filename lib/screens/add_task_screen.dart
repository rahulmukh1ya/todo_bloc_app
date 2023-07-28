import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_bloc_app/widgets/custom_form_field.dart';
import '../blocs/bloc_exports.dart';
// import '../blocs/form_bloc/bloc/form_bloc_state.dart';
import '../blocs/form_bloc/bloc/form_bloc_state.dart';
// import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController titleController = TextEditingController();
    // final TextEditingController messageController = TextEditingController();
    // final TextEditingController dateTimeController = TextEditingController();
    // DateTime dateTime = DateTime.now();

    return AlertDialog(
        scrollable: true,
        content: Container(
          width: MediaQuery.of(context).size.width,
          height: 435,
          padding: const EdgeInsets.all(0),
          child: BlocBuilder<FormBloc, FormScreenState>(
            builder: (context, state) {
              return Form(
                child: Column(children: [
                  const Text(
                    'Add Task',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    hintText: 'Name',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s"),
                      )
                    ],
                  ),
                ]),
              );
            },
          ),
        ));
  }
}


/*

return AlertDialog(
      scrollable: true,
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 435,
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                label: Text('Message'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dateTimeController,
              decoration: const InputDecoration(
                label: Text('Date Time'),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final DateTime? pickedDateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025));
                if (pickedDateTime != null) {
                  dateTimeController.text = pickedDateTime.toString();
                  dateTime = pickedDateTime;
                }
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      name: nameController.text,
                      email: emailController.text,
                      title: titleController.text,
                      message: messageController.text,
                      dateTime: dateTime
                    );
                    context.read<TaskBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                )
              ],
            )
          ],
        ),
      ),
    );
 */