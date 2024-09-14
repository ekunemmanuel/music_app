import '../../domain/models/song_model.dart';

class FirebaseSong {
  late String id;
  late String artist;
  late String title;
  late String album;
  late String imageUrl;
  late String songUrl;

  FirebaseSong();
  // Convert FirebaseSong to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "title": title,
      "artist": artist,
      "album": album,
      "imageUrl": imageUrl,
      "songUrl": songUrl,
    };
  }

  // Convert from JSON to FirebaseSong
  FirebaseSong.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    album = json["album"];
    title = json["title"];
    imageUrl = json["imageUrl"];
    songUrl = json["songUrl"];
    artist = json["artist"];
  }

  // Convert from FirebaseSong to Song model
  Song toDomain() {
    return Song(
        id: id,
        title: title,
        artist: artist,
        album: album,
        imageUrl: imageUrl,
        songUrl: songUrl);
  }

  // Convert from Song model to FirebaseSong
  static FirebaseSong fromDomain(Song song) {
    return FirebaseSong()
      ..album = song.album
      ..id = song.id
      ..songUrl = song.songUrl
      ..artist = song.artist
      ..title = song.title
      ..imageUrl = song.imageUrl;
  }
}

