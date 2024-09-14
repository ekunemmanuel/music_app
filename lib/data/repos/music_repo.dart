import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_app/domain/models/song_model.dart';

import '../../domain/repos/music_repo.dart';
import '../models/song_model.dart';

class FirebaseSongRepo implements MusicRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Fetch all songs from Firestore
  @override
  Future<List<Song>> fetchMusicLibrary() async {
    final songs = await _firestore.collection('songs').get();
    return songs.docs
        .map((e) => FirebaseSong.fromJson(e.data()).toDomain())
        .toList();
  }

// Get a song by its ID
  @override
  Future<Song> getSong(Song song) async {
    FirebaseSong firebaseSong = FirebaseSong.fromDomain(song);
    final result =
        await _firestore.collection('songs').doc(firebaseSong.id).get();
    if (result.exists && result.data() != null) {
      return FirebaseSong.fromJson({'id': result.id, ...result.data()!})
          .toDomain();
    } else {
      throw Exception('Song not found');
    }
  }

  // Search for a song by its title
  @override
  Future<List<Song>> searchMusic(String query) async {
    final songs = await _firestore
        .collection('songs')
        .where('title', isEqualTo: query)
        .get();
    return songs.docs
        .map((e) => FirebaseSong.fromJson(e.data()).toDomain())
        .toList();
  }
}
