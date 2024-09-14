import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/song_state.dart';
import '../domain/models/song_model.dart';

class SongCubit extends Cubit<SongState> {
  final AudioPlayer player;
  final Song song;

  static SongCubit? currentInstance;
  static SongCubit? newInstance;

  SongCubit._internal(this.song)
      : player = AudioPlayer(),
        super(SongInitial()) {
    initializePlayer();
  }

  factory SongCubit(Song song) {
    if (currentInstance != null && currentInstance!.song.id == song.id) {
      return currentInstance!;
    }

    newInstance = SongCubit._internal(song);
    return newInstance!;
  }

    // Initialize the player with the song
  Future<void> initializePlayer() async {
    try {
      if (currentInstance?.song.id == newInstance?.song.id) {
        debugPrint("Initializing player with song: ${song.title}");
        emit(SongBuffering()); // Re-emit the current state
        await player.setUrl(song.songUrl);
        _listenToPlayerState();
      } else {
        debugPrint("Skipping initialization: currentInstance is null or song IDs do not match.");
      }
    } catch (e) {
      emit(SongError("Failed to initialize player: ${e.toString()}"));
    }
  }
  void _listenToPlayerState() {
    playerStateStream.listen((event) {
      if (isClosed) return; // Check if the cubit is closed before emitting

      if (event.processingState == ProcessingState.buffering) {
        emit(SongBuffering());
      } else if (event.processingState == ProcessingState.ready &&
          player.playing) {
        emit(SongPlaying(song));
      } else if (event.processingState == ProcessingState.ready &&
          !player.playing) {
        emit(SongPaused(song));
      } else if (event.processingState == ProcessingState.completed) {
        stop(); // Handle completion and restart
      }
    });
  }

  // Getter for buffer position
  Stream<PlaybackEvent> get playbackEventStream => player.playbackEventStream;
  Stream<Duration> get positionStream => player.positionStream;
  Stream<PlayerState> get playerStateStream => player.playerStateStream;

  // Play the song
  void play() {
    if (currentInstance?.song.id != newInstance?.song.id) {
      currentInstance?.dispose();
    }
    player.play();
    emit(SongPlaying(song));
    currentInstance = this;
  }

  // Pause the song
  void pause() {
    player.pause();
    emit(SongPaused(song));
  }

  // Stop the song
  void stop() {
    player.stop();
    emit(SongStopped(song));
  }

  // Seek to a specific position
  void seek(Duration position) {
    player.seek(position);
  }

  // Set volume
  void setVolume(double volume) {
    player.setVolume(volume);
  }

  // Dispose the player when not needed
  void dispose() {
    player.dispose();
  }

  // Restart the song
  void restart() {
    player.seek(Duration.zero);
    player.play();
    emit(SongPlaying(song));
  }
}
