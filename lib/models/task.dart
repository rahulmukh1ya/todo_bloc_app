import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String name;
  final String email;
  final String title;
  final String message;
  final DateTime dateTime;

  const Task({
    required this.name,
    required this.email,
    required this.title,
    required this.message,
    required this.dateTime,
  });

  Task copyWith({
    String? name,
    String? email,
    String? title,
    String? message,
    DateTime? dateTime,
  }) {
    return Task(
      name: name ?? this.name,
      email: email ?? this.email,
      title: title ?? this.title,
      message: message ?? this.message,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name' : name,
      'email' : email,
      'title': title,
      'message' : message,
      'dateTime' : dateTime,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'],
      email: map['email'],
      title: map['title'],
      message: map['message'],
      dateTime: map['dateTime']
    );
  }

  @override
  List<Object?> get props => [name, email, title, message, dateTime];
}
