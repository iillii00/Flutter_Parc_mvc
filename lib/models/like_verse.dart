class LikeVerse {
  final String book;
  final int chapter;
  final int verse;
  final String text;
  final bool isLike;
  final bool isFcm;

  LikeVerse(
      {required this.book,
      required this.chapter,
      required this.verse,
      required this.text,
      this.isLike = false,
      this.isFcm = false});
}
