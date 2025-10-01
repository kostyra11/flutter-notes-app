import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import 'bloc/note_list_bloc.dart';
import 'bloc/note_list_event.dart';
import 'bloc/note_list_state.dart';
import '../create/create_note_page.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NoteListBloc>()..add(LoadNotesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: BlocBuilder<NoteListBloc, NoteListState>(
          builder: (context, state) {
            // Text("Battery level: ${} ");

            if (state is NoteListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NoteListLoaded) {
              final notes = state.notes;
              if (notes.isEmpty) {
                return const Center(child: Text('No notes available.'));
              }
              return ListView.separated(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.content),
                  );
                },
                separatorBuilder: (_, __) => const Divider(height: 0.5),
              );
            } else if (state is NoteListError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateNotePage()),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
