import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:yly_news_app/add_note_cubit/cubit.dart';
import 'package:yly_news_app/add_note_cubit/states.dart';
import 'package:yly_news_app/widgets/note_form_add.dart';

import 'custom_button.dart';
import 'custom_textt_field.dart';


class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,NotesState>(
        listener: (context, state) {
          if(state is AddNoteFailure){
            print(state.message);
          }
          if(state is AddNoteSuccess){
            Navigator.pop(context);
          }
        }, builder: (BuildContext context, NotesState state) {
          return AbsorbPointer(
            absorbing:  state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: NoteFormAdd(),
              ),
            ),
          );
      },

      ),
    );

  }
}



