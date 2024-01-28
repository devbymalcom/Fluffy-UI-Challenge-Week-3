import 'package:fluffy_challenge_week_3/models/team.dart';
import 'package:flutter/material.dart';

List<Team> allTeams = [
  Team(
      name: 'AFC',
      followName: 'Bournemoth',
      abbreviation: 'BOU',
      logo: 'afc.png',
      winPossibility: 31),
  Team(
    name: 'Arsenal',
    followName: 'FC',
    abbreviation: 'ARS',
    logo: 'ars.png',
    winPossibility: 54,
  ),
  Team(
    name: 'Chelsea',
    followName: 'FC',
    abbreviation: 'CHE',
    logo: 'che.png',
    winPossibility: 65,
  ),
  Team(
    name: 'Crystal',
    followName: 'Palace',
    abbreviation: 'CRY',
    logo: 'cpf.png',
    winPossibility: 23,
  ),
  Team(
    name: 'Everton',
    followName: 'FC',
    abbreviation: 'EVE',
    logo: 'eve.png',
    winPossibility: 45,
  ),
  Team(
    name: 'Leicester',
    followName: 'City',
    abbreviation: 'LEI',
    logo: 'lct.png',
    winPossibility: 57,
  ),
  Team(
    name: 'Liverpool',
    followName: 'FC',
    abbreviation: 'LIV',
    logo: 'liv.png',
    winPossibility: 48,
  ),
  Team(
    name: 'Manchester',
    followName: 'City',
    abbreviation: 'MCI',
    logo: 'mct.png',
    winPossibility: 58,
  ),
  Team(
    name: 'Manchester',
    followName: 'United',
    abbreviation: 'MUN',
    logo: 'mun.png',
    winPossibility: 67,
  ),
  Team(
    name: 'Newcastle',
    followName: 'United',
    abbreviation: 'NEW',
    logo: 'ncu.png',
    winPossibility: 34,
  ),
  Team(
    name: 'Tottenham',
    followName: 'Hotspur',
    abbreviation: 'TOT',
    logo: 'tot.png',
    winPossibility: 70,
  ),
];

List<Color> colors = [
  const Color(0xFFFFC7EA),
  const Color(0xFF499BFF),
  const Color(0xFFC7FFCA),
  const Color(0xFFFFC755),
  const Color(0xFFFFC7EA)
];

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];
