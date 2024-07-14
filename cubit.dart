import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_news_app/add_note_cubit/states.dart';
import 'package:yly_news_app/models/notes_model.dart';
class AddNoteCubit extends Cubit<NotesState>{
  AddNoteCubit(): super(InitialState());


  addNote(NotesModel note)async{
    emit(AddNoteLoading());
    try{
      var notebox = Hive.box<NotesModel>('notes box');
      await notebox.add(note);
      emit(AddNoteSuccess());
    }catch(e){
       emit(AddNoteFailure(message: 'failed'));
    }
  }


}