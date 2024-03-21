import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/logic/variables.dart';

class AllQuested extends StatefulWidget {
  const AllQuested({super.key});

  @override
  State<AllQuested> createState() => _AllQuestedState();
}

class _AllQuestedState extends State<AllQuested> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Du hast $knownVocabs von ${lectionDe.length} Vokabeln richtig beantwortet!',
            style: GoogleFonts.lato(fontSize: 23),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FloatingActionButton(
                  onPressed: () => setState(() {
                        Navigator.pop(context);
                      }),
                  child: const Icon(Icons.restart_alt_outlined)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Icon(Icons.home_rounded),
              ),
            )
          ],
        ),
      ],
    ))));
  }
}
