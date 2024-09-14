import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/presentation/music_cubit.dart';
import 'package:music_app/presentation/music_state.dart';
import 'package:music_app/presentation/song_cubit.dart';

import 'song_page.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MusicCubit, MusicState>(
      builder: (constext, state) {
        if (state is MusicLoading || state is MusicInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MusicLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: state.songs.length,
              itemBuilder: (context, index) {
                final song = state.songs[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  minVerticalPadding: 0,
                  tileColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.assetNetwork(
                          width: 50,
                          height: 50,
                          placeholder:
                              'assets/song.png', // Local placeholder image
                          image: song.imageUrl, // URL of the image
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/song.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ); // Fallback when image fails to load
                          },
                          fadeInDuration: const Duration(
                              milliseconds: 200), // Optional fade-in effect
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(song.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                          Text(song.artist,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    //  go to the page where the song is played and pass the song object
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (_) => SongCubit(song),
                        child: SongPage(song: song),
                      ),
                    ));
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          );
        } else if (state is MusicError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.message),
              ElevatedButton(
                onPressed: () {
                  context.read<MusicCubit>().fetchMusic();
                },
                child: const Text('Retry'),
              ),
            ],
          );
        }
        return const Center(
          child: Text('Unknown State'),
        );
      },
    ));
  }
}
