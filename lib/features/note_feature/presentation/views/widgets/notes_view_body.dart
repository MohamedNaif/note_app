import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/notes/notes_cubit.dart';
// import '../../../model/note_model.dart';
import 'custom_app_bar.dart';

import 'note_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {


  void _changeLanguage(BuildContext context, Locale locale) {
    context.setLocale(locale);
  }
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).featchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('change_language').tr(),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: const Text('English'),
                            onTap: () {
                              _changeLanguage(context, const Locale('en', 'US'));
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('العربية'),
                            onTap: () {
                              _changeLanguage(context, const Locale('ar', 'EG'));
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );

            },
            title: ("title").tr(),
            icon: Icons.settings,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: NoteListView())
        ],
      ),
    );
  }
}
