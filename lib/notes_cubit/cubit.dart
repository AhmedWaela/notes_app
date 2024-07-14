
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:yly_news_app/notes_cubit/stats.dart';
import '../models/notes_model.dart';

class NotesCubit extends Cubit<ReadNotesState>{
  NotesCubit(): super(InitialState());

  List<NotesModel>? notes;
  fetch(){
    var notebox = Hive.box<NotesModel>('notes box');
    notes =   notebox.values.toList();
    emit(Success());
  }
}