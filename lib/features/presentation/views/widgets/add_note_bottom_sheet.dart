import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:notes_app/features/presentation/manager/add_note_cubit.dart';
import 'package:notes_app/features/presentation/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: const AddNoteForm(),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is AddNoteFailure) {
            var logger = Logger();
            logger.d(state.errorMessage);
          }

          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
