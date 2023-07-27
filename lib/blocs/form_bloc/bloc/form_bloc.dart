import 'package:flutter/widgets.dart';
import 'package:todo_bloc_app/blocs/form_bloc/bloc/form_bloc_event.dart';
import 'package:todo_bloc_app/blocs/form_bloc/bloc/form_bloc_state.dart';
import 'package:todo_bloc_app/blocs/form_bloc/models/bloc_form_item.dart';
import '../../bloc_exports.dart';

class FormBloc extends Bloc<FormScreenEvent, FormScreenState> {
  FormBloc() : super(const FormScreenState()) {
    on<InitEvent>(_initFormState);
  }

  final _formKey = GlobalKey<FormState>();

  Future<void> _initFormState(
      InitEvent event, Emitter<FormScreenState> emit) async {
    emit(state.copyWith(formKey: _formKey));
  }

  Future<void> _onNameChanged(
    NameChangedEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(state.copyWith(
      formKey: _formKey,
      name: BlocFormItem(
        value: event.name.value,
        // error: event.name.value.isValidName ? null : 'Enter name',
      )
    ));
  }
}
