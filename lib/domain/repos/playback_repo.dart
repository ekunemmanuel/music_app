import '../models/song_model.dart';

abstract class PlaybackRepository {
  Future<void> play(Song song);
  Future<void> pause();
  Future<void> stop();
  Future<void> skipToNext();
  Future<void> skipToPrevious();
  Stream<PlaybackStatus> getPlaybackStatus(); // Stream playback status updates
}
