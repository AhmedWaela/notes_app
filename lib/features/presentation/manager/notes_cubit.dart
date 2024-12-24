import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/data/models/note_model.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());

  fetchAllNotes() {
    emit(NoteLoading());
    try {
      var note = Hive.box<NoteModel>("Notes Box");
      ;

      var list = note.values.toList();
      emit(NoteSuccess(notes: list));
    } on Exception catch (e) {
      emit(NoteFailure(errorMessage: e.toString()));
    }
  }
}

sealed class NoteState {}

class NoteInitial extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> notes;

  NoteSuccess({required this.notes});
}

class NoteLoading extends NoteState {}

class NoteFailure extends NoteState {
  final String errorMessage;

  NoteFailure({required this.errorMessage});
}
