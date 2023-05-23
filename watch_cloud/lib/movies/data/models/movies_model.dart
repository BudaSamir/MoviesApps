import 'package:watch_cloud/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  MoviesModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"],
        title: json["title"],
        backdropPath: json["backdropPath"],
        genreIds: List<int>.from(json["genreIds"].map((e) => e)),
        overview: json["overview"],
        voteAverage: json["voteAverage"],
        releaseDate: json["releaseDate"]);

}
