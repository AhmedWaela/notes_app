import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_news_app/models/notes_model.dart';
import 'package:yly_news_app/widgets/custom_app_bar.dart';
import 'package:yly_news_app/widgets/custom_textt_field.dart';

import '../notes_cubit/cubit.dart';
import '../widgets/notes_list_view.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.notesModel});
  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(notesModel: notesModel,),
    );
  }
}

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.notesModel});
  final NotesModel notesModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title, content;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Edit Notes',iconData: Icons.check,onPressed: () {
            widget.notesModel.title = title ?? widget.notesModel.title;
            widget.notesModel.subTitle = content ?? widget.notesModel.subTitle;
            widget.notesModel.save();
            BlocProvider.of<NotesCubit>(context).fetch();
          },),
          const SizedBox(
            height: 20,
          ),
          CustomTexttField(hint: 'Title',onChanged: (p0) {
            title = p0;
          },),
          const SizedBox(
            height: 20,
          ),
          CustomTexttField(hint: 'Content',maxlines: 5,onChanged: (p0) {
            content = p0;
          },),

        ],
      ),
    );
  }
}

