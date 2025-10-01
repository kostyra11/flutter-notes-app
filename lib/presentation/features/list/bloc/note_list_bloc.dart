import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_app/core/device_info/services/device_info.dart';

import '../../../../domain/usecases/create_note.dart';
import '../../../../domain/usecases/get_notes.dart';
import '../../../../domain/entities/note.dart';
import 'note_list_event.dart';
import 'note_list_state.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  final GetNotesUseCase getNotes;
  final CreateNoteUseCase createNewNoteUseCase;
  final DeviceInfo deviceInfo;
  int batteryLevel = 0;

  NoteListBloc({
    required this.getNotes,
    required this.createNewNoteUseCase,
    required this.deviceInfo,
  }) : super(NoteListInitial()) {
    on<LoadNotesEvent>(_onLoadNotes);
    on<CreateNewNodeEvent>(_onCreateNewNode);
  }

  Future<void> _onLoadNotes(
      LoadNotesEvent event, Emitter<NoteListState> emit) async {
    emit(NoteListLoading());
    try {
      final notes = await getNotes();
      emit(NoteListLoaded(notes));
    } catch (e) {
      emit(NoteListError(e.toString()));
    }
  }

  Future<void> _onCreateNewNode(
      CreateNewNodeEvent event, Emitter<NoteListState> emit) async {
    emit(NoteListLoading());
    try {
      final note = await createNewNoteUseCase.call(
          title: event.title, content: event.content);
      batteryLevel = await deviceInfo.getBatteryLevel();

      emit(NoteListNewNote(note));
    } catch (e) {
      emit(NoteListError(e.toString()));
    }
  }
}
