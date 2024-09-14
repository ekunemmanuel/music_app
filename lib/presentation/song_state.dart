import 'package:equatable/equatable.dart';

import '../domain/models/song_model.dart';

class SongState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SongInitial extends SongState {
}

class SongPlaying extends SongState {
  final Song song;

  SongPlaying(this.song);

  @override
  List<Object?> get props => [song];
}

class SongPaused extends SongState {
  final Song song;

  SongPaused(this.song);

  @override
  List<Object?> get props => [song];
}

class SongStopped extends SongState {
  final Song song;

  SongStopped(this.song);

  @override
  List<Object?> get props => [song];
}

class SongBuffering extends SongState {
  
}

class SongError extends SongState {
  final String message;

  SongError(this.message);

  @override
  List<Object?> get props => [message];
}



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../domain/models/song_model.dart';
// import '../utils/index.dart';
// import 'song_cubit.dart';
// import 'song_state.dart';

// class SongPage extends StatelessWidget {
//   final Song song;

//   const SongPage({super.key, required this.song});

//   @override
//   Widget build(BuildContext context) {
//     final songCubit = context.read<SongCubit>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(song.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(999),
//               child: Image.network(
//                 song.imageUrl,
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               song.title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Text(
//               song.artist,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey[500]),
//             ),

//             const SizedBox(height: 20),
//             StreamBuilder<Duration>(
//               stream: songCubit.player.positionStream,
//               builder: (context, snapshot) {
//                 final position = snapshot.data ?? Duration.zero;
//                 return StreamBuilder<Duration?>(
//                   stream: songCubit.player.durationStream,
//                   builder: (context, snapshot) {
//                     final duration = snapshot.data ?? Duration.zero;
//                     return Row(
//                       children: [
//                         Text(formatDuration(position)),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: LinearProgressIndicator(
//                             value: duration.inSeconds > 0
//                                 ? position.inSeconds / duration.inSeconds
//                                 : 0,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(formatDuration(duration)),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//             // Music controller
//             BlocBuilder<SongCubit, SongState>(
//               builder: (context, state) {
//                 IconData icon;
//                 if (state is SongPlaying) {
//                   icon = Icons.pause_circle_filled_rounded;
//                 } else if (state is SongStopped ||
//                     state is SongInitial ||
//                     state is SongPaused) {
//                   icon = Icons.play_circle_filled_rounded;
//                 } else {
//                   icon = Icons.stop_circle_outlined;
//                 }

//                 return Container(
//                   padding: const EdgeInsets.all(8),
//                   // width: ,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     color: Colors.grey.shade200,
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       // songCubit.dispose();
//                       if (state is SongPlaying) {
//                         songCubit.pause();
//                       } else {
//                         songCubit.play();
//                       }
//                     },
//                     child: Icon(icon),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
