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

class NoteListError extends NoteListState {
  final String message;

  const NoteListError(this.message);

  @override
  List<Object?> get props => [message];
}