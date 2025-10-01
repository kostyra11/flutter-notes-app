import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/di/injection.dart';

import '../list/bloc/note_list_bloc.dart';
import '../list/bloc/note_list_event.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  late TextEditingController titleControllet;
  late TextEditingController contentControllet;

  @override
  void initState() {
    titleControllet = TextEditingController();
    contentControllet = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleControllet.dispose();
    contentControllet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleControllet,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentControllet,
              decoration: const InputDecoration(labelText: 'Content'),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            BlocProvider(
              create: (_) => sl<NoteListBloc>(),
              child: ElevatedButton(
                onPressed: () {
                  sl<NoteListBloc>().add(CreateNewNodeEvent(
                    title: titleControllet.text,
                    content: contentControllet.text,
                  ));
                  sl<NoteListBloc>().add(LoadNotesEvent());

                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
