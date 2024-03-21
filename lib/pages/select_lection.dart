import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/pages/event_pages/load.dart';
import 'package:karteikarto/logic/db_connection.dart';
import 'package:karteikarto/logic/functions.dart';
import 'package:karteikarto/logic/variables.dart';

class SelectLektionPage extends StatelessWidget {
  const SelectLektionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lektionen',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () async {
              await getBasics();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: ListView.builder(
        itemCount: listViewTitles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
            child: ListTile(
              title: Text(
                listViewTitles[index],
                style: GoogleFonts.lato(fontWeight: FontWeight.w500),
              ),
              onTap: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoadVocabsPage()));
                selectedLektionIndex = index;
                await getVocabs();
                listIndex = 0;
                turned = false;
                alreadyQuested = [0];
                dontKnownVocabs = 0;
                knownVocabs = 0;
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => loadResponsivePage()));
              },
            ),
          );
        },
      ),
    );
  }
}
