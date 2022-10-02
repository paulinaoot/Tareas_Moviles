import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_2/bloc/fav_songs_bloc.dart';
import 'package:practica_2/song.dart';

import 'components/big_card.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key, required this.song});

  final Song song;

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<FavSongsBloc, FavSongsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text('Added to favorites'),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                  BlocProvider.of<FavSongsBloc>(context)
                      .add(AddFavSongEvent(songToAdd: widget.song));
                },
                icon: Icon(
                  Icons.favorite,
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigCard(
              author: widget.song.author,
              title: widget.song.title,
              imageUrl: widget.song.imageUrl,
            ),
          ],
        ),
      ),
    );
  }
}
