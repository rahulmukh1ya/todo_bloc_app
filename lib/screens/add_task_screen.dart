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
