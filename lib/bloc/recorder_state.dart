part of 'recorder_bloc.dart';

abstract class RecorderState extends Equatable {
  const RecorderState();

  @override
  List<Object> get props => [];
}

class RecorderInitial extends RecorderState {}

class RecorderSuccessState extends RecorderState {
  final Song song;

  RecorderSuccessState({required this.song});

  @override
  List<Object> get props => [this.song];
}

class RecorderFailedState extends RecorderState {}

class RecorderRecordingState extends RecorderState {}
