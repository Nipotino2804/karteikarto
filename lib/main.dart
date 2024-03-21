import 'package:flutter/material.dart';
import 'package:karteikarto/pages/event_pages/load.dart';
import 'package:karteikarto/pages/event_pages/no_network.dart';
import 'package:karteikarto/pages/home.dart';
import 'package:karteikarto/logic/variables.dart';

void main() async {
  runApp(const LoadingScreen());
  lections = [];
  listViewTitles = [];
  checkNetworkConnection();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: title,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
