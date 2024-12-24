import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
}

sealed class AddNoteState {}

class AddNoteInitial extends AddNoteState {}
