import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_news_app/models/notes_model.dart';
import 'package:yly_news_app/notes_cubit/cubit.dart';
import 'package:yly_news_app/notes_cubit/stats.dart';

import 'note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,ReadNotesState>(
      builder: (context, state) {

        List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                child: NoteItem(notesModel: notes[index],),
              );
            },
          ),
        );
      },
    );
  }
}