import '../../domain/entities/note.dart';

class NoteModel {
  final int id;
  final String title;
  final String content;

  NoteModel({required this.id, required this.title, required this.content});

  factory NoteModel.fromEntity(Note note) {
    return NoteModel(id: note.id, title: note.title, content: note.content);
  }

  Note toEntity() {
    return Note(id: id, title: title, content: content);
  }
}