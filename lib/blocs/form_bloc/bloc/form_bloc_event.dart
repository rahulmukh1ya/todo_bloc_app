import 'package:equatable/equatable.dart';
// import 'package:flutter/services.dart';
import 'package:todo_bloc_app/blocs/form_bloc/models/bloc_form_item.dart';

abstract class FormScreenEvent extends Equatable {
  const FormScreenEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends FormScreenEvent {
  const InitEvent();
}

class NameChangedEvent extends FormScreenEvent {
  const NameChangedEvent({required this.name});

  final BlocFormItem name;

  @override
  List<Object?> get props => [name];
}

class EmailChangedEvent extends FormScreenEvent {
  const EmailChangedEvent({required this.email});

  final BlocFormItem email;

  @override
  List<Object?> get props => [email];
}

class TitleChangedEvent extends FormScreenEvent {
  const TitleChangedEvent({required this.title});

  final BlocFormItem title;

  @override
  List<Object?> get props => [title];
}

class MessageChangedEvent extends FormScreenEvent {
  const MessageChangedEvent({required this.message});

  final BlocFormItem message;

  @override
  List<Object?> get props => [message];
}

class DateTimeChangedEvent extends FormScreenEvent {
  const DateTimeChangedEvent({required this.dateTime});

  final BlocFormItem dateTime;

  @override
  List<Object?> get props => [dateTime];
}


class FormSubmitEvent extends FormScreenEvent {

}
