import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_app/services/firestore_service.dart';
import '../../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FirestoreService _firestoreService;
  TaskBloc(this._firestoreService) : super(const TaskLoaded()) {
    on<LoadTask>(_onLoadTask);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  Future<void> _onLoadTask(LoadTask event, Emitter<TaskState> emit) async {
    emit(TaskLoading());

    try {
      final List<Task> task = await _firestoreService.getTask().first;
      emit(TaskLoaded(tasks: task));
    } catch (e) {
      emit(TaskError(errorMessage: e.toString()));
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      await _firestoreService.addTask(event.task);
      emit(const TaskOperationSuccess(message: 'Task added Successfully'));
    } catch (e) {
      emit(TaskError(errorMessage: e.toString()));
    }
    // final state = this.state;

    // if (state is TaskLoaded) {
    //   await _firestoreService.addTask(event.task);

    //   // emit(TaskLoaded(tasks: List.from(state.tasks)..add(event.task)));
    //   // this is manually adding task into the task list rather than fetching from firebase
    // }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      await _firestoreService.updateTask(event.task);
      emit(const TaskOperationSuccess(message: 'Task updated Successfully'));
    } catch (e) {
      emit(TaskError(errorMessage: e.toString()));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      await _firestoreService.deleteTask(event.taskId);
      emit(const TaskOperationSuccess(message: 'Task deleted Successfully'));
    } catch (e) {
      emit(TaskError(errorMessage: e.toString()));
    }
  }
}
