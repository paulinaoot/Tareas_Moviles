part of 'fav_songs_bloc.dart';

abstract class FavSongsEvent extends Equatable {
  const FavSongsEvent();

  @override
  List<Object> get props => [];
}

class GetAllFavsEvent extends FavSongsEvent {}

class AddFavSongEvent extends FavSongsEvent {
  final Song songToAdd;

  AddFavSongEvent({required this.songToAdd});

  @override
  List<Object> get props => [this.songToAdd];
}

class RemoveFavEvent extends FavSongsEvent {
  final String title;

  RemoveFavEvent({required this.title});

  @override
  List<Object> get props => [this.title];
}
