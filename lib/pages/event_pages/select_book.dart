import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/logic/db_connection.dart';
import 'package:karteikarto/logic/variables.dart';
import 'package:karteikarto/main.dart';

class SelectBook extends StatefulWidget {
  const SelectBook({super.key});

  @override
  State<SelectBook> createState() => _SelectBookState();
}

class _SelectBookState extends State<SelectBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Bücher',
              style: GoogleFonts.lato(fontWeight: FontWeight.w600)),
          leading: IconButton(
              onPressed: () async {
                lections = [];
                listViewTitles = [];
                settingName = [];
                settingValue = [];
                await getBasics();
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.65,
                child: GestureDetector(
                  onTap: () async {
                    selectedBook = 0;
                    lections = [];
                    listViewTitles = [];
                    settingName = [];
                    settingValue = [];
                    await getLektions();
                    switchBook = true;
                    setState(() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
                          ),
                          (route) => false);
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          bookNames[0],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.65,
                child: GestureDetector(
                  onTap: () async {
                    selectedBook = 1;
                    lections = [];
                    listViewTitles = [];
                    settingName = [];
                    settingValue = [];
                    await getLektions();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                        (route) => false);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          bookNames[1],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
