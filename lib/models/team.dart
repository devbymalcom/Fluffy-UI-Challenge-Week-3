import 'dart:convert';

class Team {
  String name;
  String followName;
  String abbreviation;
  String logo;
  int winPossibility;
  Team({
    required this.name,
    required this.followName,
    required this.abbreviation,
    required this.logo,
    required this.winPossibility,
  });

  Team copyWith({
    String? name,
    String? followName,
    String? abbreviation,
    String? logo,
    int? winPossibility,
  }) {
    return Team(
      name: name ?? this.name,
      followName: followName ?? this.followName,
      abbreviation: abbreviation ?? this.abbreviation,
      logo: logo ?? this.logo,
      winPossibility: winPossibility ?? this.winPossibility,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'followName': followName,
      'abbreviation': abbreviation,
      'logo': logo,
      'winPossibility': winPossibility,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      name: map['name'] as String,
      followName: map['followName'] as String,
      abbreviation: map['abbreviation'] as String,
      logo: map['logo'] as String,
      winPossibility: map['winPossibility'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) =>
      Team.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Team(name: $name, followName: $followName, abbreviation: $abbreviation, logo: $logo, winPossibility: $winPossibility)';
  }

  @override
  bool operator ==(covariant Team other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.followName == followName &&
        other.abbreviation == abbreviation &&
        other.logo == logo &&
        other.winPossibility == winPossibility;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        followName.hashCode ^
        abbreviation.hashCode ^
        logo.hashCode ^
        winPossibility.hashCode;
  }
}
