import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/features/data/models/note_model.dart';

class NotesCubit extends Cubit<NoteState> {
  NotesCubit() : super(NoteInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var note = Hive.box<NoteModel>("Notes Box");

    notes = note.values.toList();
  }
}

sealed class NoteState {}

class NoteInitial extends NoteState {}
