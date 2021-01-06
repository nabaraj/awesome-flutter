// import 'package:awesapp/pages/home_page.dart';
import 'dart:js';

import 'package:awesapp/pages/home_page.dart';
// import 'package:awesapp/pages/home_pageFB.dart';
// import 'package:awesapp/pages/home_pageSB.dart';
import 'package:awesapp/pages/login_page.dart';
import "package:flutter/material.dart";
import "dart:math";

import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesapp/utils/Constants.dart';

returnTheme() {
  var list = [
    {"color": 'Lime', "theme": Colors.lime},
    {"color": 'Red', "theme": Colors.red},
    {"color": 'Indigo', "theme": Colors.indigo},
    {"color": 'Purple', "theme": Colors.purple},
    {"color": 'Amber', "theme": Colors.amber},
    {"color": 'Green', "theme": Colors.green},
    {"color": 'Pink', "theme": Colors.pink},
    {"color": 'Blue', "theme": Colors.blue},
    {"color": 'Light-Blue', "theme": Colors.lightBlue},
    {"color": 'Cyan', "theme": Colors.cyan},
    {"color": 'Teal', "theme": Colors.teal},
    {"color": 'Light-green', "theme": Colors.lightGreen},
    {"color": 'Orange', "theme": Colors.orange},
    {"color": 'Deep Orange', "theme": Colors.deepOrange},
    {"color": 'Yellow', "theme": Colors.yellow},
    {"color": 'Brown', "theme": Colors.brown},
    {"color": 'Grey', "theme": Colors.grey},
    {"color": 'Blue Grey', "theme": Colors.blueGrey}
  ];

  var randomColor = list[Random().nextInt(list.length)];
  print(randomColor);
  return randomColor;
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  var themeMethod = returnTheme();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Awesome App ${themeMethod['color']}",
    home:
        Constants.prefs.getBool('loggedIn') == true ? HomePage() : LoginPage(),
    theme: ThemeData(
        primarySwatch: themeMethod['theme'],
        buttonTheme: ButtonThemeData(
          buttonColor: themeMethod['theme'],
          textTheme: ButtonTextTheme.primary,
        )),
    routes: {
      '/login': (context) => LoginPage(),
      '/home': (context) => HomePage()
    },
  ));
}
