part of 'google_auth_bloc.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();
  
  @override
  List<Object> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthSuccessState extends GoogleAuthState {}

class GoogleAuthErrorState extends GoogleAuthState {
  final String error;

  GoogleAuthErrorState({required this.error});

  @override
  List<Object> get props => [this.error];
}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSignOutSuccessState extends GoogleAuthState {}