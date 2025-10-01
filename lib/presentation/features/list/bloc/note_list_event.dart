import 'package:equatable/equatable.dart';

abstract class NoteListEvent extends Equatable {
  const NoteListEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotesEvent extends NoteListEvent {}