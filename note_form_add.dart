import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yly_news_app/add_note_cubit/cubit.dart';
import 'package:yly_news_app/add_note_cubit/states.dart';
import 'package:yly_news_app/models/notes_model.dart';

import '../notes_cubit/cubit.dart';
import 'custom_button.dart';
import 'custom_textt_field.dart';

class NoteFormAdd extends StatefulWidget {
  const NoteFormAdd({super.key});

  @override
  State<NoteFormAdd> createState() => _NoteFormAddState();
}

class _NoteFormAddState extends State<NoteFormAdd> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title , subTitle;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTexttField(hint: 'Title',onSaved: (p0) {
            title = p0;
          },),
          SizedBox(
            height: 20,
          ),
          CustomTexttField(hint: 'Content',maxlines: 5,onSaved: (p0) {
            subTitle = p0;
          },),
           BlocBuilder<AddNoteCubit,NotesState>(
             builder: (context, state) {
               return  CustomButton(
                 isLoading: state is AddNoteLoading ? true : false,
                 onTap: () {
                   if(formKey.currentState!.validate()){
                     formKey.currentState!.save();
                     var date = DateTime.now();
                     var foramtdate = DateFormat('dd-mm-yyyy').format(date);
                     var note = NotesModel(title: title!, subTitle: subTitle!, date: foramtdate, color: Colors.orange.value);
                     BlocProvider.of<AddNoteCubit>(context).addNote(note);
                     BlocProvider.of<NotesCubit>(context).fetch();
                   }else{
                     autovalidateMode = AutovalidateMode.always;
                     setState(() {

                     });
                   }
                 },);
             },
           ),
          const SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
