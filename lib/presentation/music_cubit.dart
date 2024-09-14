import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/repos/music_repo.dart';
import 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  final MusicRepository musicRepository;

  MusicCubit(this.musicRepository) : super(MusicInitial());

  void fetchMusic() async {
    emit(MusicLoading());
    try {
      final songs = await musicRepository.fetchMusicLibrary();
      emit(MusicLoaded(songs));
    } catch (e) {
      emit(MusicError(e.toString()));
    }
  }

  void searchMusic(String query) async {
    emit(MusicLoading());
    try {
      final songs = await musicRepository.searchMusic(query);
      emit(MusicLoaded(songs));
    } catch (e) {
      emit(MusicError(e.toString()));
    }
  }

  void clear() {
    emit(MusicInitial());
  }
}
