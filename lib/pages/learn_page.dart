import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/pages/event_pages/all_quested.dart';
import 'package:karteikarto/logic/functions.dart';
import 'package:karteikarto/logic/variables.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.restart_alt_rounded),
              onPressed: () => setState(() {
                listIndex = 0;
                turned = false;
                alreadyQuested = [0];
                dontKnownVocabs = 0;
                knownVocabs = 0;
              }),
            )
          ],
          leading: IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    cardWidth(mobile: mobile),
                height: MediaQuery.of(context).size.width *
                    cardHeight(mobile: mobile),
                child: Card(
                  child: Center(
                    child: Text(
                      viewCardText(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            viewButtons(onPressContinue: () {
              setState(() {
                turned = true;
              });
            }, onPressKnow: () {
              knownVocabs++;
              if (lectionLat.length == knownVocabs + dontKnownVocabs) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const AllQuested(),
                ));
              } else {
                setState(() {
                  turned = false;
                  shuffelQuestions();
                });
              }
            }, onPressDontKnow: () {
              dontKnownVocabs++;
              if (lectionDe.length == knownVocabs + dontKnownVocabs) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AllQuested()));
              } else {
                setState(() {
                  turned = false;
                  shuffelQuestions();
                });
              }
            })
          ],
        ));
  }
}
