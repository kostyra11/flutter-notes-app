import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_notes.dart';
import '../../../../domain/entities/note.dart';
import 'note_list_event.dart';
import 'note_list_state.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  final GetNotesUseCase getNotes;

  NoteListBloc({required this.getNotes}) : super(NoteListInitial()) {
    on<LoadNotesEvent>(_onLoadNotes);
  }

  Future<void> _onLoadNotes(LoadNotesEvent event, Emitter<NoteListState> emit) async {
    emit(NoteListLoading());
    try {
      final notes = await getNotes();
      emit(NoteListLoaded(notes));
    } catch (e) {
      emit(NoteListError(e.toString()));
    }
  }
}