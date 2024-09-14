import '../models/song_model.dart';

abstract class MusicRepository {
  Future<List<Song>> fetchMusicLibrary();
  Future<Song> getSong(Song song);
  Future<List<Song>> searchMusic(String query);
}
