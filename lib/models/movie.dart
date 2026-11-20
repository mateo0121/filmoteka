enum MovieType { film, series }

class Movie {
 

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.type,
    required this.genre,
    required this.rating,
    required this.watched,
    required this.favorite,
  });
  final int id;
  final String title;
  final int year;
  final MovieType type;
  final String genre;
  final double rating;
  bool watched;
  bool favorite;
}