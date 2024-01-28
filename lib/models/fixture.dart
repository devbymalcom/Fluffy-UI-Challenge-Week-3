import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:fluffy_challenge_week_3/models/team.dart';

class Fixture {
  DateTime kickOffTime;
  List<Team> teams;
  Fixture({
    required this.kickOffTime,
    required this.teams,
  });

  Fixture copyWith({
    DateTime? kickOffTime,
    List<Team>? teams,
  }) {
    return Fixture(
      kickOffTime: kickOffTime ?? this.kickOffTime,
      teams: teams ?? this.teams,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kickOffTime': kickOffTime.millisecondsSinceEpoch,
      'teams': teams.map((x) => x.toMap()).toList(),
    };
  }

  factory Fixture.fromMap(Map<String, dynamic> map) {
    return Fixture(
      kickOffTime:
          DateTime.fromMillisecondsSinceEpoch(map['kickOffTime'] as int),
      teams: List<Team>.from(
        (map['teams'] as List<int>).map<Team>(
          (x) => Team.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Fixture.fromJson(String source) =>
      Fixture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Fixture(kickOffTime: $kickOffTime, teams: $teams)';

  @override
  bool operator ==(covariant Fixture other) {
    if (identical(this, other)) return true;

    return other.kickOffTime == kickOffTime && listEquals(other.teams, teams);
  }

  @override
  int get hashCode => kickOffTime.hashCode ^ teams.hashCode;
}
