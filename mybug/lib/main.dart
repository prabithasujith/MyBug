import 'package:flutter/material.dart';
import 'package:mybug/activity_accepted.dart';
import 'package:mybug/home_page_scale.dart';
import 'package:mybug/mood_selection.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageScale(),
      theme: ThemeData(
          textTheme: TextTheme(
              caption: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  wordSpacing: 0.5,
                  fontSize: 30))),
      routes: {
        ActivityAccepted.route: (ctx) {
          return ActivityAccepted();
        },
        MyHomePage.route: (ctx) {
          return MyHomePage();
        },
        MoodSelection.route: (ctx) {
          return MoodSelection();
        }
      },
    );
  }
}
