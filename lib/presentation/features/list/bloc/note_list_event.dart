import 'package:equatable/equatable.dart';

abstract class NoteListEvent extends Equatable {
  const NoteListEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotesEvent extends NoteListEvent {}

class CreateNewNodeEvent extends NoteListEvent {
  final String title;
  final String content;

  const CreateNewNodeEvent({required this.title, required this.content});

  @override
  List<Object?> get props => [title, content];
}
