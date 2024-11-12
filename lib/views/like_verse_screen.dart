// lib/views/like_verse_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_mvc/controllers/verse_event.dart';
import '../controllers/verse_bloc.dart';
import '../controllers/verse_state.dart';
import '../models/like_verse.dart';


class LikeVerseScreen extends StatelessWidget {
  const LikeVerseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liked Verses")),
      body: BlocBuilder<VerseBloc, VerseState>(
        builder: (context, state) {
          if (state is VerseUpdated) {
            final likeVerses = state.verseModel.likeVerses;
            return ListView.builder(
              itemCount: likeVerses.length,
              itemBuilder: (context, index) {
                final verse = likeVerses[index];
                return ListTile(
                  title: Text("${verse.book} ${verse.chapter}:${verse.verse} - ${verse.text}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<VerseBloc>().add(DeleteLikeEvent(verse));
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No liked verses yet.'));
        },
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final verse = LikeVerse(
            book: "Genesis",
            chapter: 1,
            verse: 1,
            text: "In the beginning...",
            isLike: true,
          );
          context.read<VerseBloc>().add(AddLikeEvent(verse));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
