import 'package:equatable/equatable.dart';

import 'package:flutter_notes_app/domain/entities/note.dart';

abstract class NoteListState extends Equatable {
  const NoteListState();

  @override
  List<Object?> get props => [];
}

class NoteListInitial extends NoteListState {}

class NoteListLoading extends NoteListState {}

class NoteListLoaded extends NoteListState {
  final List<Note> notes;

  const NoteListLoaded(this.notes);

  @override
  List<Object?> get props => [notes];
}

class NoteListNewNote extends NoteListState {
  final Note note;

  const NoteListNewNote(this.note);

  @override
  List<Object?> get props => [note];
}

class NoteListError extends NoteListState {
  final String message;

  const NoteListError(this.message);

  @override
  List<Object?> get props => [message];
}

class NoteBatteryLevelState extends NoteListState {
  final String batteryLevelState;

  const NoteBatteryLevelState(this.batteryLevelState);

  @override
  List<Object?> get props => [batteryLevelState];
}
