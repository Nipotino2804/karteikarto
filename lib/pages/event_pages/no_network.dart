import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:karteikarto/logic/db_connection.dart';
import 'package:karteikarto/logic/variables.dart';
import 'package:karteikarto/main.dart';
import 'package:karteikarto/pages/event_pages/old_version.dart';

void checkNetworkConnection() async {
  final networkListener = InternetConnection();
  networkListener.onStatusChange.listen((InternetStatus status) async {
    networkStatus = status;
    await getBasics();
    switch (status) {
      case InternetStatus.connected:
        if (cVersion != lVersion) {
          runApp(const OldVersion());
        } else {
          runApp(const MyApp());
        }
        break;
      case InternetStatus.disconnected:
        runApp(const NotConnected());
        break;
    }
  });
}

class NotConnected extends StatelessWidget {
  const NotConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Karteikarto (Cursus)',
        theme: ThemeData(useMaterial3: true),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Bitte stelle eine Internetverbindung her!',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 26),
              ),
            ),
          ),
        ));
  }
}
