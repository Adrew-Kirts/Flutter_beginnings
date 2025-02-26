import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_drive/profile_page.dart';
import 'package:test_drive/social_page.dart';
import 'favorites_page.dart';
import 'layout_exo.dart';
import 'helpers/navigatorHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>{};

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('My great app',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          toolbarHeight: 60.0,
        ),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('RANDOM NAME')),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  appState.toggleFavorite();
                },
                child: Row(children: [
                  Icon(appState.favorites.contains(pair)
                      ? Icons.favorite
                      : Icons.favorite_border),
                  Text(' LIKE')
                ]),
              ),
            ],
          ),
          SizedBox(height: 60),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesPage(favorites: appState.favorites),
                ),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite_sharp),
                SizedBox(width: 4),
                Text('Favorites'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.grey.shade400,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(height: 50),
          ElevatedButton(onPressed: () {
            NavigatorHelper().toSpecificPage(
                context: context, page: LayoutExoPage());
          }, child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.draw),
              Text('Layout Page'),
            ],
          )),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {
            NavigatorHelper().toSpecificPage(
                context: context, page: SocialPage());
          }, child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
            Icon(Icons.person),
            Text(' Static Social Page')
          ]),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {
            NavigatorHelper().toSpecificPage(
                context: context, page: ProfilePage());
          }, child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
            Icon(Icons.person),
            Text(' Dynamic Profile Page')
          ]),
          ),
        ],
      ),
    ));
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Column(
      children: [
        Center(
          child: Card(
            elevation: 8,
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(pair.asUpperCase, style: textStyle),
            ),
          ),
        ),
      ],
    );
  }
}
