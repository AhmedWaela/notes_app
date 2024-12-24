import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/features/data/models/note_model.dart';
import 'package:notes_app/features/presentation/views/notes_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("Notes Box");
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: NotesView(),
    );
  }
}
