class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String imageUrl;  // For album art or song image
  final String songUrl;   // URL to stream the song

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
    required this.songUrl,
  });
}

enum PlaybackStatus {
  playing,
  paused,
  stopped,
}
