import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/data/models/note_model.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());
}

sealed class NoteState {}

class NoteInitial extends NoteState {}

class AddNoteSuccess extends NoteState {
  final List<NoteModel> notes;

  AddNoteSuccess({required this.notes});
}

class AddNoteLoading extends NoteState {}

class AddNoteFailure extends NoteState {
  final String errorMessage;

  AddNoteFailure({required this.errorMessage});
}
