import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:karteikarto/pages/learn_page.dart';
import 'package:karteikarto/logic/variables.dart';
import 'package:responsive_builder/responsive_builder.dart';

signitureColor(context) {
  switch (MediaQuery.of(context).platformBrightness) {
    case Brightness.dark:
      return Colors.white54;
    case Brightness.light:
      return Colors.black54;
  }
}

cardWidth({required bool mobile}) {
  switch (mobile) {
    case true:
      return 0.90;
    case false:
      return 0.60;
  }
}

cardHeight({required bool mobile}) {
  switch (mobile) {
    case true:
      return 0.55;
    case false:
      return 0.25;
  }
}

lectionExtensions() {
  switch (settingsSwitchPPP) {
    case true:
      return lectionExpPPP;
    case false:
      return lectionExp;
  }
}

void shuffelQuestions() {
  listIndex = Random().nextInt(lectionLat.length);
  if (alreadyQuested.contains(listIndex) == true) {
    listIndex = Random().nextInt(lectionLat.length);
    shuffelQuestions();
  }
  alreadyQuested.add(listIndex);
}

viewCardText() {
  // Display question and answer in card mode
  switch (turned) {
    case false:
      return lectionLat[listIndex];
    case true:
      if (lectionExtensions()[listIndex].isEmpty) {
        return lectionDe[listIndex];
      } else {
        return "${lectionExtensions()[listIndex]} \n ${lectionDe[listIndex]}";
      }
  }
}

loadResponsivePage() {
  return ResponsiveBuilder(
    builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        mobile = false;
      }
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        mobile = true;
      }
      return const LearnPage();
    },
  );
}

viewButtons(
    {required onPressContinue,
    required onPressKnow,
    required onPressDontKnow}) {
  switch (turned) {
    case true:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
                onPressed: onPressKnow,
                child: Text(
                  '\n Wusste ich \n',
                  style: GoogleFonts.lato(),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ElevatedButton(
                onPressed: onPressDontKnow,
                child: Text(
                  '\n Wusste ich nicht \n',
                  style: GoogleFonts.lato(),
                )),
          )
        ],
      );
    case false:
      return ElevatedButton(
          onPressed: onPressContinue,
          child: Text(
            '\n Weiter \n',
            style: GoogleFonts.lato(),
          ));
  }
}

randomColor() {
  List colorsAvailable = [
    Colors.amber,
    Colors.blue,
    Colors.cyan,
    Colors.green,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lime,
    Colors.orange,
    Colors.pink,
    Colors.red,
    Colors.teal,
    Colors.yellow
  ];
  int randomInt = Random().nextInt(colorsAvailable.length);
  return colorsAvailable[randomInt];
}
