import 'package:equatable/equatable.dart';

import '../domain/models/song_model.dart';

// MusicState is the state of the music player
class MusicState extends Equatable{
  @override
  List<Object?> get props => [];
}

// MusicInitial is the initial state of the music player
class MusicInitial extends MusicState {}

// MusicLoading is the state when the music player is loading
class MusicLoading extends MusicState {}

// MusicLoaded is the state when the music player has loaded the songs
class MusicLoaded extends MusicState {
  final List<Song> songs;

  MusicLoaded(this.songs);

  @override
  List<Object?> get props => [songs];
}

// MusicError is the state when the music player encounters an error
class MusicError extends MusicState {
  final String message;

  MusicError(this.message);

  @override
  List<Object?> get props => [message];
}