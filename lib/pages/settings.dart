import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/logic/db_connection.dart';
import 'package:karteikarto/logic/variables.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Einstellungen',
            style: GoogleFonts.lato(fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
              onPressed: () async {
                lections = [];
                listViewTitles = [];
                settingName = [];
                settingValue = [];
                await getBasics();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SwitchListTile(
                    inactiveTrackColor: Colors.grey.shade600.withOpacity(0.3),
                    inactiveThumbColor: Colors.grey.shade300,
                    trackOutlineColor:
                        const MaterialStatePropertyAll(Colors.white),
                    title: Text(
                      'Perfekt & PPP lernen',
                      style: GoogleFonts.lato(fontSize: 21),
                    ),
                    value: settingsSwitchPPP,
                    onChanged: (value) {
                      setState(() {
                        settingsSwitchPPP = value;
                      });
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
