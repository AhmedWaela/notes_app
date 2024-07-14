import 'package:flutter/material.dart';
import 'package:yly_news_app/widgets/custom_textt_field.dart';
import 'package:yly_news_app/widgets/notes_view_body.dart';

import '../widgets/add_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context, builder: (context) {
            return const AddBottomSheet();
          },);
        },child: const Icon(Icons.add),),
      body: const NotesViewBody(),
    );
  }
}




