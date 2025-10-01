import 'package:get_it/get_it.dart';

import '../data/datasources/note_local_datasource.dart';
import '../data/repositories/note_repository_impl.dart';
import '../domain/repositories/note_repository.dart';
import '../domain/usecases/create_note.dart';
import '../domain/usecases/get_notes.dart';
import '../presentation/features/list/bloc/note_list_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  // Data sources
  sl.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<NoteRepository>(
    () => NoteRepositoryImpl(localDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton<GetNotesUseCase>(
    () => GetNotesUseCase(repository: sl()),
  );
  sl.registerLazySingleton<CreateNoteUseCase>(
    () => CreateNoteUseCase(repository: sl()),
  );

  // Blocs
  sl.registerFactory(() => NoteListBloc(getNotes: sl()));
}