class MediaItem {
  MediaItem({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.mediaType,
  });

  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String overview;
  final String releaseDate;
  final String mediaType;

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      id: json['id'],
      title: (json['title'] != null) ? json['title'] : json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: (json['release_date'] != null) ? json['release_date'] : json['first_air_date'],
      mediaType: json['media_type'],
    );
  }

  factory MediaItem.fromMap(Map<String, dynamic> json) {
    return MediaItem(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      mediaType: json['media_type'],
    );
  }
}
