import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/simple_bloc_observer.dart';
import 'package:notes_app/features/data/models/note_model.dart';
import 'package:notes_app/features/presentation/manager/add_note_cubit.dart';
import 'package:notes_app/features/presentation/views/notes_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox("Notes Box");
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
        debugShowCheckedModeBanner: false,
        home: NotesView(),
      ),
    );
  }
}
