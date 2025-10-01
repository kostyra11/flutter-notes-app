import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_local_datasource.dart';
import '../models/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  NoteRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Note>> getNotes() async {
    final models = await localDataSource.getNotes();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Note> createNote(String title, String content) async {
    final model = await localDataSource.createNote(title, content);
    return model.toEntity();
  }
}