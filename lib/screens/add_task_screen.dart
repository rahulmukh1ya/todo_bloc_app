import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:todo_bloc_app/blocs/form_bloc/bloc/form_bloc_event.dart';
import 'package:todo_bloc_app/blocs/form_bloc/models/bloc_form_item.dart';
import 'package:todo_bloc_app/widgets/custom_form_field.dart';
import '../blocs/bloc_exports.dart';
// import '../blocs/form_bloc/bloc/form_bloc_state.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
  });

  final TextEditingController dateTimeController = TextEditingController();
  // DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        content: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(0),
          child: BlocBuilder<FormBloc, FormScreenState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: state.formKey,
                  child: Column(children: [
                    const Text(
                      'Add Task',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      onChanged: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            NameChangedEvent(name: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.name.error;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      onChanged: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            EmailChangedEvent(
                                email: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.email.error;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      labelText: 'Title',
                      hintText: 'Enter your title',
                      onChanged: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            TitleChangedEvent(
                                title: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.title.error;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      labelText: 'Message',
                      hintText: 'Enter your message',
                      onChanged: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            MessageChangedEvent(
                                message: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.message.error;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
                      labelText: 'Date Time',
                      hintText: 'Select the date time',
                      // onChanged: (val) {
                      //   BlocProvider.of<FormBloc>(context).add(
                      //       DateTimeChangedEvent(
                      //           dateTime:
                      //               BlocFormItem(value: val!.toString())));
                      // },
                      controller: dateTimeController,
                      onTap: () async {
                        final DateTime? pickedDateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2025));
                        if (pickedDateTime != null && context.mounted) {
                          // dateTimeController.text = pickedDateTime.toString();
                          dateTimeController.text =
                              '${pickedDateTime.year}-${pickedDateTime.month}-${pickedDateTime.day}';

                          BlocProvider.of<FormBloc>(context).add(
                              DateTimeChangedEvent(
                                  dateTime: BlocFormItem(
                                      value: pickedDateTime.toString())));
                        }
                      },
                      validator: (val) {
                        return state.message.error;
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
                            print(state.dateTime.value);

                            if (state.formKey!.currentState!.validate()) {
                              print('yo this form is valid');

                              var task = Task(
                                name: state.name.value,
                                email: state.email.value,
                                title: state.title.value,
                                message: state.message.value,
                                dateTime: DateTime.parse(state.dateTime.value),
                              );
                              context.read<TaskBloc>().add(AddTask(task: task));
                            }
                            BlocProvider.of<FormBloc>(context)
                                .add(const FormSubmitEvent());

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Task added Successfully'),
                                backgroundColor: Colors.green,
                              ),
                              
                            );

                            Navigator.pop(context);
                          },
                          child: const Text('Add'),
                        )
                      ],
                    )
                  ]),
                ),
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