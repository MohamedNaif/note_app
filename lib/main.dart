import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant.dart';
// import 'features/note_feature/cubits/add_note/add_note_cubit_cubit.dart';
import 'features/note_feature/cubits/notes/notes_cubit.dart';
import 'features/note_feature/model/note_model.dart';
import 'features/note_feature/presentation/views/notes_view.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
    path: 'assets/translations', // <-- change the path of the translation files
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const NotesView(),
      ),
    );
  }
}
