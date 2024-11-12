import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/like_verse.dart';

class VerseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LikeVerse>> getLikedVerses(String uid) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('likeVerse')
        .get();

    return snapshot.docs.map((doc) => LikeVerse.fromMap(doc.data())).toList();
  }

  Future<void> addLikeVerse(String uid, LikeVerse likeVerse) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('likeVerse')
        .add(likeVerse.toMap());
  }

  Future<void> deleteLikeVerse(String uid, LikeVerse likeVerse) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('likeVerse')
        .where('book', isEqualTo: likeVerse.book)
        .where('chapter', isEqualTo: likeVerse.chapter)
        .where('verse', isEqualTo: likeVerse.verse)
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
