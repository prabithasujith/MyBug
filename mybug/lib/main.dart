import 'package:flutter/material.dart';
import 'package:mybug/screens/activity_accepted.dart';
import 'package:mybug/screens/home_page_scale.dart';
import 'package:mybug/screens/mood_selection.dart';

import 'screens/home_page.dart';

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
                  fontSize: 30),
                  
                  button: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.w500)
                  )),
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
