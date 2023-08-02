// import 'package:equatable/equatable.dart';
// import 'package:flutter/widgets.dart';
// import 'package:todo_bloc_app/blocs/form_bloc/models/bloc_form_item.dart';


part of 'form_bloc.dart';

class FormScreenState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem email;
  final BlocFormItem title;
  final BlocFormItem message;
  // final BlocFormItem dateTime;
  final GlobalKey<FormState>? formKey;

  const FormScreenState({
    this.name = const BlocFormItem(error: 'Enter name'),
    this.email = const BlocFormItem(error: 'Enter email'),
    this.title = const BlocFormItem(error: 'Enter title'),
    this.message = const BlocFormItem(error: 'Enter message'),
    // this.dateTime = const BlocFormItem(error: 'Enter date time'),
    this.formKey,
  });

  FormScreenState copyWith({
    BlocFormItem? name,
    BlocFormItem? email,
    BlocFormItem? title,
    BlocFormItem? message,
    // BlocFormItem? dateTime,
    GlobalKey<FormState>? formKey,
  }) {
    return FormScreenState(
      name: name ?? this.name,
      email: email ?? this.email,
      title: title ?? this.title,
      message: message ?? this.message,
      // dateTime: dateTime ?? this.dateTime,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [name, email, title, message, formKey];
  // put dateTime later
  //removed formKey
}
