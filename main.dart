import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yly_news_app/add_note_cubit/cubit.dart';
import 'package:yly_news_app/bloc_observer.dart';
import 'package:yly_news_app/models/notes_model.dart';
import 'package:yly_news_app/notes_cubit/cubit.dart';
import 'package:yly_news_app/notes_view/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  await Hive.initFlutter();
  Bloc.observer = SimpleObserver();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes box');
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit(),),
        BlocProvider(create: (context) => NotesCubit(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark
          ),
        home: const NotesView(),
      ),
    );
  }
}
