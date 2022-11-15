// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:practica_2/auth/bloc/google_auth_bloc.dart';
import 'package:practica_2/bloc/fav_songs_bloc.dart';
import 'package:practica_2/bloc/recorder_bloc.dart';
import 'package:practica_2/home_page.dart';
import 'package:practica_2/sign_in.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp();
  return runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FavSongsBloc()..add((GetAllFavsEvent())),
      ),
      BlocProvider(
        create: (context) => RecorderBloc(),
      ),
      BlocProvider(
        create: (context) => GoogleAuthBloc()..add(VerifyGoogleAuthEvent()),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      themeMode: ThemeMode.dark,
      title: 'Material App',
      home: BlocConsumer<GoogleAuthBloc, GoogleAuthState>(
        listener: (context, state) {},
        builder: (context, state) {
        if (state is GoogleAuthSuccessState) {
            print("Success Auth");
            return HomePage();
          } else if (state is GoogleAuthErrorState ||
              state is GoogleAuthSignOutSuccessState) {
            print("Google auth sign out success");
            return SignInPage();
          } else if (state is GoogleAuthLoadingState) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            print(state);
            return Scaffold(
              body: Center(
                child: Text("Error al iniciar :("),
              ),
            );
          }
        },
      ),
    );
  }
}
