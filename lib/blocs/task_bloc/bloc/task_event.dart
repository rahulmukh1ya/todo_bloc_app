part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTask extends TaskEvent {
  final List<Task> tasks;
  const LoadTask({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final String taskId;
  const DeleteTask({
    required this.taskId,
  });

  @override
  List<Object> get props => [taskId];
}
