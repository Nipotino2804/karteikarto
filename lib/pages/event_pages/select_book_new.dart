import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/logic/db_connection.dart';
import 'package:karteikarto/logic/variables.dart';
import 'package:karteikarto/main.dart';

class SelectBookNew extends StatefulWidget {
  const SelectBookNew({super.key});

  @override
  State<SelectBookNew> createState() => _SelectBookNewState();
}

class _SelectBookNewState extends State<SelectBookNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Bücher',
              style: GoogleFonts.lato(fontWeight: FontWeight.w600)),
          leading: IconButton(
              onPressed: () async {
                await getBasics();
                setState(() {
                  Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bookNames.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: GestureDetector(
                    onTap: () async {
                      selectedBook = index;
                      switchBook = true;
                      await getLektions();
                      await getBasics();
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
                            bookNames[index],
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
            );
          },
        ));
  }
}
