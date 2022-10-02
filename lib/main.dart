// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:practica_2/bloc/fav_songs_bloc.dart';
import 'package:practica_2/bloc/recorder_bloc.dart';
import 'package:practica_2/home_page.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  return runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FavSongsBloc()..add((GetAllFavsEvent())),
      ),
      BlocProvider(
        create: (context) => RecorderBloc(),
      ),
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
      home: HomePage(),
    );
  }
}
