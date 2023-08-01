import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:todo_bloc_app/blocs/form_bloc/bloc/form_bloc_event.dart';
import 'package:todo_bloc_app/blocs/form_bloc/bloc/form_bloc_state.dart';
import 'package:todo_bloc_app/blocs/form_bloc/models/bloc_form_item.dart';
import 'package:todo_bloc_app/utils/extensions.dart';

// import '../../bloc_exports.dart';

class FormBloc extends Bloc<FormScreenEvent, FormScreenState> {
  FormBloc() : super(const FormScreenState()) {
    on<InitEvent>(_initFormState);
    on<NameChangedEvent>(_onNameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<TitleChangedEvent>(_onTitleChanged);
    on<MessageChangedEvent>(_onMessageChanged);
    on<FormSubmitEvent>(_onFormSubmitted);
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
    emit(
      state.copyWith(
        formKey: _formKey,
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isValidName ? null : 'Enter name',
        ),
      ),
    );
  }

  Future<void> _onEmailChanged(
    EmailChangedEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        formKey: _formKey,
        name: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isValidEmail ? null : 'Enter email',
        ),
      ),
    );
  }

  Future<void> _onTitleChanged(
    TitleChangedEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        formKey: _formKey,
        name: BlocFormItem(
          value: event.title.value,
          error: event.title.value.isValidTitle ? null : 'Enter title',
        ),
      ),
    );
  }

  Future<void> _onMessageChanged(
    MessageChangedEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        formKey: _formKey,
        name: BlocFormItem(
          value: event.message.value,
          error: event.message.value.isValidMessage ? null : 'Enter message',
        ),
      ),
    );
  }


  Future<void> _onFormSubmitted(
    FormSubmitEvent event,
    Emitter<FormScreenState> emit,
  ) async {
    if(_formKey.currentState!.validate()){
        // add to the tasks 
    }
  }


}
