import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import '../domain/models/song_model.dart';
import 'song_cubit.dart';
import 'song_state.dart';

class SongPage extends StatelessWidget {
  final Song song;

  const SongPage({super.key, required this.song});

  // @override
  @override
  Widget build(BuildContext context) {
    final songCubit = context.read<SongCubit>();
    print("current instance ${SongCubit.currentInstance?.song.id}");
    // print("new instance ${SongCubit.newInstance?.song.id}");
    return Scaffold(
      appBar: AppBar(
          // title: Text(song.title),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SongArt(imageUrl: song.imageUrl),
            const SizedBox(height: 8),
            Text(
              song.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              song.artist,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500]),
            ),
            const SizedBox(height: 20),
            BlocConsumer<SongCubit, SongState>(
              builder: (context, state) {
                IconData icon;
                late Duration duration;
                late Duration position;
                if (state is SongPlaying) {
                  icon = Icons.pause_circle_filled_rounded;
                } else if (state is SongStopped ||
                    state is SongInitial ||
                    state is SongPaused) {
                  icon = Icons.play_circle_filled_rounded;
                } else {
                  icon = Icons.stop_circle_outlined;
                }
                return StreamBuilder2(
                  streams: StreamTuple2(
                      songCubit.player.playbackEventStream, songCubit.player.positionStream),
                  builder: (context, snapshots) {
                    final playbackEvent = snapshots.snapshot1.data;
                    final bufferedPosition =
                        playbackEvent?.bufferedPosition ?? Duration.zero;
                    duration = playbackEvent?.duration ?? Duration.zero;
                    position = snapshots.snapshot2.data ?? Duration.zero;

                    return Column(
                      children: [
                        ProgressBar(
                          progress: position,
                          buffered: bufferedPosition,
                          total: duration,
                          onSeek: (duration) {
                            songCubit.seek(duration);
                          },
                        ),
                        Text(state.toString()),
                        const SizedBox(height: 20),
                        state is SongBuffering
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : InkWell(
                                borderRadius: BorderRadius.circular(999),
                                onTap: () {
                                  if (state is SongPlaying) {
                                    songCubit.pause();
                                  } else if (state is SongStopped) {
                                    // state again by initialing
                                    songCubit.restart();
                                  } else {
                                    songCubit.play();
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    icon,
                                    size: 40,
                                  ),
                                ),
                              ),
                      ],
                    );
                  },
                );
              },
              listener: (context, state) {},
            )
          ],
        ),
      ),
    );
  }
}

class SongArt extends StatelessWidget {
  const SongArt({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/song.png', // Local placeholder image
        image: imageUrl, // URL of the image
        width: 300,
        height: 300,
        fit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/song.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ); // Fallback when image fails to load
        },
        fadeInDuration:
            const Duration(milliseconds: 200), // Optional fade-in effect
      ),
    );
  }
}
