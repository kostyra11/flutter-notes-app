import '../entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> createNote(String title, String content);
}