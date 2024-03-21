import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/logic/variables.dart';
import 'package:karteikarto/main.dart';
import 'package:url_launcher/url_launcher.dart';

class OldVersion extends StatefulWidget {
  const OldVersion({super.key});

  @override
  State<OldVersion> createState() => _OldVersionState();
}

class _OldVersionState extends State<OldVersion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(useMaterial3: true),
      title: title,
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Sie haben eine veraltete Version von Karteikarto installiert!\nUm Karteikarto nutzen zu können muss die App aktualisiert werden.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            GestureDetector(
              onDoubleTap: () {
                cVersion = lVersion;
                runApp(const MyApp());
              },
              child: Text(
                '\nAktuelle Version herunterladen:',
                style:
                    GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      
                      launchUrl(Uri.parse(dwnloadApk));
                    },
                    icon: const Icon(
                      Icons.android,
                      size: 44,
                    )),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                    onPressed: () async {
                      launchUrl(Uri.parse(dwnloadWin));
                    },
                    icon: const Icon(
                      Icons.window_sharp,
                      size: 40,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
