class Movies {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  Movies({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movies &&
          id == other.id &&
          title == other.title &&
          backdropPath == other.backdropPath &&
          genreIds == other.genreIds &&
          overview == other.overview &&
          voteAverage == other.voteAverage &&
          releaseDate == other.releaseDate;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      backdropPath.hashCode ^
      genreIds.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode ^
      releaseDate.hashCode;
}
