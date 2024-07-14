import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yly_news_app/models/notes_model.dart';
import 'package:yly_news_app/notes_view/edit_note_view.dart';

import '../notes_cubit/cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notesModel});
  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(notesModel: notesModel,);
        },));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color: const Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title:  Text(notesModel.title,style: TextStyle(color: Colors.black,fontSize: 26),),
              subtitle:  Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(notesModel.subTitle,style: TextStyle(color: Colors.black,fontSize: 20)),
              ),
              trailing: IconButton(onPressed: () {
                notesModel.delete();
                BlocProvider.of<NotesCubit>(context).fetch();
                }, icon: const Icon(Icons.delete,color: Colors.black,size: 30,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(notesModel.date,style: TextStyle(color: Colors.black.withOpacity(0.4)),),
            )
          ],
        ),
      ),
    );
  }
}