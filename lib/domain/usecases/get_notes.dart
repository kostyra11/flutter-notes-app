import '../entities/note.dart';
import '../repositories/note_repository.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase({required this.repository});

  Future<List<Note>> call() async {
    return await repository.getNotes();
  }
}