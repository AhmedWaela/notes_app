import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/data/models/note_model.dart';
import 'package:notes_app/features/presentation/manager/notes_cubit.dart';
import 'package:notes_app/features/presentation/views/widgets/custom_app_bar.dart';
import 'package:notes_app/features/presentation/views/widgets/custom_text_field.dart';
import 'package:notes_app/features/presentation/views/widgets/edit_color_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onTap: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.content = content ?? widget.noteModel.content;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            iconData: Icons.check,
            title: "Edit Notes",
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: widget.noteModel.title,
            onChanged: (p0) {
              title = p0;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (p0) {
              content = p0;
            },
            hintText: widget.noteModel.content,
            maxLines: 5,
          ),
          EditNotesColorsList(
            noteModel: widget.noteModel,
          )
        ],
      ),
    );
  }
}
