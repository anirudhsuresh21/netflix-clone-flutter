import 'dart:convert';
import 'dart:core';

class SearchModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    SearchModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    SearchModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        SearchModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory SearchModel.fromRawJson(String str) => SearchModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    String? backdropPath;
    int id;
    String? originalName;
    String? overview;
    String? posterPath;
    String mediaType;
    bool adult;
    String? name;
    String? originalLanguage;
    List<int>? genreIds;
    double popularity;
    DateTime? firstAirDate;
    double? voteAverage;
    int? voteCount;
    List<String>? originCountry;
    String? originalTitle;
    String? title;
    String? releaseDate;
    bool? video;
    int? gender;
    String? knownForDepartment;
    dynamic profilePath;
    List<KnownFor>? knownFor;

    Result({
        this.backdropPath,
        required this.id,
        this.originalName,
        this.overview,
        this.posterPath,
        required this.mediaType,
        required this.adult,
        this.name,
        this.originalLanguage,
        this.genreIds,
        required this.popularity,
        this.firstAirDate,
        this.voteAverage,
        this.voteCount,
        this.originCountry,
        this.originalTitle,
        this.title,
        this.releaseDate,
        this.video,
        this.gender,
        this.knownForDepartment,
        this.profilePath,
        this.knownFor,
    });

    Result copyWith({
        String? backdropPath,
        int? id,
        String? originalName,
        String? overview,
        String? posterPath,
        String? mediaType,
        bool? adult,
        String? name,
        String? originalLanguage,
        List<int>? genreIds,
        double? popularity,
        DateTime? firstAirDate,
        double? voteAverage,
        int? voteCount,
        List<String>? originCountry,
        String? originalTitle,
        String? title,
        String? releaseDate,
        bool? video,
        int? gender,
        String? knownForDepartment,
        dynamic profilePath,
        List<KnownFor>? knownFor,
    }) => 
        Result(
            backdropPath: backdropPath ?? this.backdropPath,
            id: id ?? this.id,
            originalName: originalName ?? this.originalName,
            overview: overview ?? this.overview,
            posterPath: posterPath ?? this.posterPath,
            mediaType: mediaType ?? this.mediaType,
            adult: adult ?? this.adult,
            name: name ?? this.name,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            genreIds: genreIds ?? this.genreIds,
            popularity: popularity ?? this.popularity,
            firstAirDate: firstAirDate ?? this.firstAirDate,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
            originCountry: originCountry ?? this.originCountry,
            originalTitle: originalTitle ?? this.originalTitle,
            title: title ?? this.title,
            releaseDate: releaseDate ?? this.releaseDate,
            video: video ?? this.video,
            gender: gender ?? this.gender,
            knownForDepartment: knownForDepartment ?? this.knownForDepartment,
            profilePath: profilePath ?? this.profilePath,
            knownFor: knownFor ?? this.knownFor,
        );

    factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"]!,
        adult: json["adult"],
        name: json["name"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalTitle: json["original_title"],
        title: json["title"],
        releaseDate: json["release_date"],
        video: json["video"],
        gender: json["gender"],
        knownForDepartment: json["known_for_department"],
        profilePath: json["profile_path"],
        knownFor: json["known_for"] == null ? [] : List<KnownFor>.from(json["known_for"]!.map((x) => KnownFor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "adult": adult,
        "name": name,
        "original_language": originalLanguage,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date": "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_title": titleValues.reverse[originalTitle],
        "title": titleValues.reverse[title],
        "release_date": releaseDate,
        "video": video,
        "gender": gender,
        "known_for_department": knownForDepartment,
        "profile_path": profilePath,
        "known_for": knownFor == null ? [] : List<dynamic>.from(knownFor!.map((x) => x.toJson())),
    };
}

class KnownFor {
    String? backdropPath;
    int? id;
    String? originalName;
    String? overview;
    String? posterPath;
    MediaType? mediaType;
    bool? adult;
    String? name;
    String? originalLanguage;
    List<int>? genreIds;
    double? popularity;
    DateTime? firstAirDate;
    double? voteAverage;
    int? voteCount;
    List<String>? originCountry;

    KnownFor({
        required this.backdropPath,
        required this.id,
        required this.originalName,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.adult,
        required this.name,
        required this.originalLanguage,
        required this.genreIds,
        required this.popularity,
        required this.firstAirDate,
        required this.voteAverage,
        required this.voteCount,
        this.originCountry,
    });

    KnownFor copyWith({
        String? backdropPath,
        int? id,
        String? originalName,
        String? overview,
        String? posterPath,
        MediaType? mediaType,
        bool? adult,
        String? name,
        String? originalLanguage,
        List<int>? genreIds,
        double? popularity,
        DateTime? firstAirDate,
        double? voteAverage,
        int? voteCount,
        List<String>? originCountry,
    }) => 
        KnownFor(
            backdropPath: backdropPath ?? this.backdropPath,
            id: id ?? this.id,
            originalName: originalName ?? this.originalName,
            overview: overview ?? this.overview,
            posterPath: posterPath ?? this.posterPath,
            mediaType: mediaType ?? this.mediaType,
            adult: adult ?? this.adult,
            name: name ?? this.name,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            genreIds: genreIds ?? this.genreIds,
            popularity: popularity ?? this.popularity,
            firstAirDate: firstAirDate ?? this.firstAirDate,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
            originCountry: originCountry ?? this.originCountry,
        );

    factory KnownFor.fromRawJson(String str) => KnownFor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        adult: json["adult"],
        name: json["name"],
        originalLanguage: json["original_language"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"] != null ? DateTime.parse(json["first_air_date"]) : null,
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] != null ? List<String>.from(json["origin_country"].map<String>((x) => x.toString())) : [],


    );

    Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaTypeValues.reverse[mediaType],
        "adult": adult,
        "name": name,
        "original_language": originalLanguage,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date": "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": List<dynamic>.from(originCountry!.map((x) => x)),
    };
}

enum MediaType {
    MOVIE,
    PERSON,
    TV
}

final mediaTypeValues = EnumValues({
    "movie": MediaType.MOVIE,
    "person": MediaType.PERSON,
    "tv": MediaType.TV
});

enum Title {
    MONEY,
    TITLE_MONEY
}

final titleValues = EnumValues({
    "Money": Title.MONEY,
    "MONEY": Title.TITLE_MONEY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
