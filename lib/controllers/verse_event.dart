import '../models/like_verse.dart';

abstract class VerseEvent {}

class AddLikeEvent extends VerseEvent {
  final LikeVerse likeVerse;

  AddLikeEvent(this.likeVerse);
}

class DeleteLikeEvent extends VerseEvent {
  final LikeVerse likeVerse;

  DeleteLikeEvent(this.likeVerse);
}