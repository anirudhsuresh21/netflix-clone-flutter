import 'dart:convert';

class TvSeriesCast {
    List<Cast> cast;
    List<Cast> crew;
    int id;

    TvSeriesCast({
        required this.cast,
        required this.crew,
        required this.id,
    });

    TvSeriesCast copyWith({
        List<Cast>? cast,
        List<Cast>? crew,
        int? id,
    }) => 
        TvSeriesCast(
            cast: cast ?? this.cast,
            crew: crew ?? this.crew,
            id: id ?? this.id,
        );

    factory TvSeriesCast.fromRawJson(String str) => TvSeriesCast.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TvSeriesCast.fromJson(Map<String, dynamic> json) => TvSeriesCast(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
        "id": id,
    };
}

class Cast {
    bool adult;
    int gender;
    int id;
    String knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String? profilePath;
    String? character;
    String creditId;
    int? order;
    String? department;
    String? job;

    Cast({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        this.character,
        required this.creditId,
        this.order,
        this.department,
        this.job,
    });

    Cast copyWith({
        bool? adult,
        int? gender,
        int? id,
        String? knownForDepartment,
        String? name,
        String? originalName,
        double? popularity,
        String? profilePath,
        String? character,
        String? creditId,
        int? order,
        String? department,
        String? job,
    }) => 
        Cast(
            adult: adult ?? this.adult,
            gender: gender ?? this.gender,
            id: id ?? this.id,
            knownForDepartment: knownForDepartment ?? this.knownForDepartment,
            name: name ?? this.name,
            originalName: originalName ?? this.originalName,
            popularity: popularity ?? this.popularity,
            profilePath: profilePath ?? this.profilePath,
            character: character ?? this.character,
            creditId: creditId ?? this.creditId,
            order: order ?? this.order,
            department: department ?? this.department,
            job: job ?? this.job,
        );

    factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
    };
}
