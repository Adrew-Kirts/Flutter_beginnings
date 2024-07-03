import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:test_drive/main.dart';

class FavoritesPage extends StatelessWidget {
  final Set<WordPair> favorites;

  const FavoritesPage({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body:
      ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return BigCard(pair: favorites.elementAt(index));
        },
      ),
    );
  }
}