import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_mvc/controllers/verse_event.dart';
import 'package:prac_mvc/controllers/verse_state.dart';
import 'package:prac_mvc/models/verse_model.dart';
import 'package:prac_mvc/repositories/verse_repository.dart';


class VerseBloc extends Bloc<VerseEvent, VerseState> {

  final VerseModel verseModel;
  final VerseRepository verseRepository;

  VerseBloc(this.verseModel, this.verseRepository) : super(VerseInitial()) {


    on<AddLikeEvent>((event, emit) {
      verseModel.addLikeVerse(event.likeVerse);
      verseRepository.addLikeVerse(uid, event.likeVerse);
      emit(VerseUpdated(verseModel));
    });


    on<DeleteLikeEvent>((event, emit) {
      verseModel.deleteLikeVerse(event.likeVerse);
      emit(VerseUpdated(verseModel));
    });

  }

}
