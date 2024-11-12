import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/verse_bloc.dart';
import 'models/verse_model.dart';
import 'views/like_verse_screen.dart';

// First : for change branch



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final verseModel = VerseModel();
    return MaterialApp(
      title: 'MVC with Bloc',
      home: BlocProvider(
        create: (_) => VerseBloc(verseModel),
        child: LikeVerseScreen(),
      ),
    );
  }
}
