import '../entities/note.dart';
import '../repositories/note_repository.dart';

class CreateNoteUseCase {
  final NoteRepository repository;

  CreateNoteUseCase({required this.repository});

  Future<Note> call({required String title, required String content}) async {
    return await repository.createNote(title, content);
  }
}