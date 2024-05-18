library global;

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// Database
const String dbUsername = '';
const String dbPassword = '';
const String dbHost = '';
const String dbName = 'karteikarto';
const int dbPort = 3306;

//Settings
bool settingsSwitchPPP = true; // true: on   false: off
bool devMode = false;

// Card
bool mobile = false;
bool turned = false;

//General
InternetStatus networkStatus = InternetStatus.connected;
String title = '';
String cVersion = '0.9.7';
String lVersion = '';
String credits = '';
int listIndex = 0;
List<int> alreadyQuested = [
  0,
];
List settingName = [];
List settingValue = [];

/// Dev
List bookNames = [];
List listViewTables = [];
int? selectedBook;
bool switchBook = true;

// Point System
int knownVocabs = 0;
int dontKnownVocabs = 0;
List userAchievementData = [];

// Lektion
List lectionLat = [];
List lectionExp = [];
List lectionExpPPP = [];
List lectionDe = [];
List lections = [];
int selectedLektionIndex = 0;

// ListView
List<String> listViewTitles = [];

// Update Links
String dwnloadApk = 'https://nipotino2804.de/download/karteikarto_latest.apk';
String dwnloadWin = 'https://nipotino2804.de/download/karteikarto_latest.zip';
