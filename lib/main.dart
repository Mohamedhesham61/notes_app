import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/home_screen/home_screen_imports.dart';
import 'package:notes_app/simple_bloc_observer.dart';

import 'cubits/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 865),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => NotesCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
            home: const HomeScreenView(),
          ),
        );
      },
    );
  }
}
