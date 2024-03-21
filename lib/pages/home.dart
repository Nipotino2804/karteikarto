import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/logic/db_connection.dart';
import 'package:karteikarto/logic/variables.dart';
import 'package:karteikarto/logic/functions.dart';
import 'package:karteikarto/pages/event_pages/select_book_new.dart';
import 'package:karteikarto/pages/select_lection.dart';
import 'package:karteikarto/pages/settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: dynamicAppBarButton(context),
      ),
      /*floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              )),
          child: const Icon(Icons.settings),
        ),
      ),*/
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 6,
                ),
                Text('Lateinvokabeln lernen mit $title',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 34, fontWeight: FontWeight.w700)),
                const Spacer(
                  flex: 1,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (selectedBook == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectBookNew(),
                          ));
                    } else {
                      await getLektions();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectLektionPage(),
                          ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      dynamicStartText(),
                      style: GoogleFonts.lato(fontSize: 20),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                Text(
                  'Made by NipotiSoftware | Anton Malerz${showCredits()}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.robotoMono(
                      color: signitureColor(context),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamicStartText() {
    if (selectedBook == null) {
      return 'Buch auswählen';
    } else {
      return 'Los geht\'s';
    }
  }

  dynamicAppBarButton(context) {
    if (selectedBook == null) {
      return [
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                )),
            icon: const Icon(Icons.settings))
      ];
    } else {
      return [
        Text(bookNames[int.parse('$selectedBook')]),
        IconButton(
            onPressed: () {
              switchBook = true;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectBookNew(),
                  ));
            },
            icon: const Icon(Icons.book_rounded)),
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                )),
            icon: const Icon(Icons.settings))
      ];
    }
  }

  showCredits() {
    if (credits.isNotEmpty) {
      return '\nCredits: $credits';
    } else {
      return '';
    }
  }
}
