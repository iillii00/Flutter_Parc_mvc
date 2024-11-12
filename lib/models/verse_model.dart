import 'package:prac_mvc/models/like_verse.dart';
import 'package:prac_mvc/models/verse_note.dart';

class VerseModel{
  List<LikeVerse> likeVerses = [];
  List<VerseNote> verseNotes = [];

  void addLikeVerse(LikeVerse likeVerse){
  likeVerses.add(likeVerse);
  }

  void deleteLikeVerse(LikeVerse likeVerse) {
    likeVerses.removeWhere((v) => v.book == likeVerse.book && v.chapter == likeVerse.chapter && v.verse == likeVerse.verse);
  }

  void addVerseNote(VerseNote note){
    verseNotes.add(note);
  }

  void deleteVerseNoteById(String id) {
    verseNotes.removeWhere((note) => note.id == id);
  }

}