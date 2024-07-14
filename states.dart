

abstract class NotesState{}

class InitialState extends NotesState
{}

class AddNoteLoading extends NotesState{}

class AddNoteSuccess extends NotesState{
}

class AddNoteFailure extends NotesState{
  final String message;

  AddNoteFailure({required this.message});
}