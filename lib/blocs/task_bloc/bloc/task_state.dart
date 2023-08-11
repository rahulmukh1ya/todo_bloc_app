part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

// class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskOperationSuccess extends TaskState {
  final String message;
  const TaskOperationSuccess({required this.message});
}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class TaskError extends TaskState {
  final String errorMessage;
  const TaskError({required this.errorMessage});
}
