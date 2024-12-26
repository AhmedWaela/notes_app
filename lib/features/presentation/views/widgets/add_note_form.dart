import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/features/data/models/note_model.dart';
import 'package:notes_app/features/presentation/manager/add_note_cubit.dart';
import 'package:notes_app/features/presentation/views/widgets/colors_list_view.dart';
import 'package:notes_app/features/presentation/views/widgets/custom_button.dart';
import 'package:notes_app/features/presentation/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> key = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: "Content",
            maxLines: 5,
          ),
          SizedBox(
            height: 32,
          ),
          ColorsListView(),
          BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
            return CustomButton(
              isloading: state is AddNoteLoading ? true : false,
              onTap: () async {
                if (key.currentState!.validate()) {
                  key.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =
                      DateFormat("dd-mm-yyy").format(currentDate);
                  NoteModel noteModel = NoteModel(
                    title: title!,
                    content: subtitle!,
                    date: currentDate,
                    color: Colors.yellow.value,
                  );
                  await BlocProvider.of<AddNoteCubit>(context)
                      .addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
