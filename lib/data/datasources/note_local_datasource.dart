import '../models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();

  Future<NoteModel> createNote(String title, String content);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final List<NoteModel> _notes = [
    NoteModel(id: 0, title: "First note", content: "First note content"),
    NoteModel(id: 1, title: "Second note", content: "Second note content")
  ];
  int _idCounter = 0;

  @override
  Future<List<NoteModel>> getNotes() async {
    return List<NoteModel>.from(_notes);
  }

  @override
  Future<NoteModel> createNote(String title, String content) async {
    final note = NoteModel(id: _idCounter++, title: title, content: content);
    _notes.add(note);
    return note;
  }
}