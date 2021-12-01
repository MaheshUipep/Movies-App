import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String overview;
  final String releaseDate;
  final bool? adult;
  final String backdropPath;
  final List<int>? genreIds;
  final int? voteCount;
  final String? originalLanguage;
  final String? originalTitle;
  final int id;
  final bool? video;
  final String title;
  final double voteAverage;
  final String posterPath;
  final double? popularity;
  final String? mediaType;

  const MovieModel({
    required this.overview,
    required this.releaseDate,
    this.adult,
    required this.backdropPath,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    required this.id,
    this.video,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      overview: json['overview'],
      releaseDate: json['release_date'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      voteCount: json['vote_count'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      id: json['id'],
      video: json['video'],
      title: json['title'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['vote_count'] = this.voteCount;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['id'] = this.id;
    data['video'] = this.video;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
