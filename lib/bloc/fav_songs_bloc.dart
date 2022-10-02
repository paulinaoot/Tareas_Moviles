import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../song.dart';

part 'fav_songs_event.dart';
part 'fav_songs_state.dart';

class FavSongsBloc extends Bloc<FavSongsEvent, FavSongsState> {
  List<Song> favSongs = [
    new Song(
      author: 'The Killers',
      title: 'Mr. Brightside',
      imageUrl: 'https://source.unsplash.com/random',
      songLink: '',
    ),
    new Song(
      author: 'Bad Bunny',
      title: 'Andrea',
      imageUrl: 'https://source.unsplash.com/random',
      songLink: '',
    ),
  ];

  FavSongsBloc() : super(FavSongsInitial()) {
    on<GetAllFavsEvent>(getAllFavSongs);
    on<RemoveFavEvent>(removeFavSong);
    on<AddFavSongEvent>(addFavSong);
  }

  FutureOr<void> getAllFavSongs(event, emit) {
    emit(FavSongsSuccessState(favSongs: this.favSongs));
  }

  FutureOr<void> removeFavSong(event, emit) {
    String songToRemove = event.title;
    this.favSongs.removeWhere((element) => element.title == songToRemove);
    emit(FavSongsSuccessState(favSongs: this.favSongs));
  }

  FutureOr<void> addFavSong(event, emit) {
    if (event.songToAdd != null) {
      this.favSongs.add(event.songToAdd);
      emit(FavSongsSuccessState(favSongs: this.favSongs));
    } else {
      emit(FavSongsErrorState());
    }
  }
}
