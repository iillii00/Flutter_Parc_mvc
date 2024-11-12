import 'package:prac_mvc/models/verse_model.dart';

abstract class VerseState{}


class VerseInitial extends VerseState{}


class VerseUpdated extends VerseState{
  final VerseModel verseModel;
  VerseUpdated(this.verseModel);
}