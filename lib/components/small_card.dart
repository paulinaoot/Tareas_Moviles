// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this,sort_child_properties_last, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_2/bloc/fav_songs_bloc.dart';

class SmallCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  SmallCard({
    required this.author,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[700],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://source.unsplash.com/random',
                    // scale: 4.0,
                  ),
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    BlocProvider.of<FavSongsBloc>(context)
                        .add(RemoveFavEvent(title: this.title));
                  },
                ),
                top: 10.0,
                left: 10.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.author,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
