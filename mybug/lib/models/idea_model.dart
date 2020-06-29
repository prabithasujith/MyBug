import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

enum EnergyScale { ENERGIZED, DULL, PLEASANT, UNPLEASANT }

class IdeasModel {
  static EnergyScale energyLevel;

  static EnergyScale pleasantLevel;
  static int activityNumber = 0;

  static var currentMood = '';

  static var userSelectedEmotionList = [];
  static void generateUserEmotionList() {
    userEmotionsList.clear();
    if (energyLevel == EnergyScale.DULL &&
        pleasantLevel == EnergyScale.PLEASANT) {
      userEmotionsList.add('Relaxed');
      userEmotionsList.add('Carefree');
      userEmotionsList.add('Calm');
      userEmotionsList.add('Serene');
    } else if (energyLevel == EnergyScale.DULL &&
        pleasantLevel == EnergyScale.UNPLEASANT) {
      userEmotionsList.add('Bored');
      userEmotionsList.add('Tired');
      userEmotionsList.add('Gloomy');
      userEmotionsList.add('Sad');
    } else if (energyLevel == EnergyScale.ENERGIZED &&
        pleasantLevel == EnergyScale.PLEASANT) {
      userEmotionsList.add('Excited');
      userEmotionsList.add('Lively');
      userEmotionsList.add('Cheerful');
      userEmotionsList.add('Happy');
    } else if (energyLevel == EnergyScale.ENERGIZED &&
        pleasantLevel == EnergyScale.UNPLEASANT) {
      userEmotionsList.add('Tense');
      userEmotionsList.add('Nervous');
      userEmotionsList.add('Irritated');
      userEmotionsList.add('Anxious');
    } else {}
  }

  static List<String> userEmotionsList = [];
  static var colors = [
    Color(0xFF11CE8A),
    Color(0xFF537AD9),
    Color(0xFF0198CF),
    Color(0xFF9A91AC),
    Color(0xFFCD5D5D),
    Color(0xFFAFD5AA),
    Color(0xFFE3A855),
  ];
  static var myMood = [
    'Happy',
    'Sad',
    'Nervous',
    'Fear',
    'Anger',
    'Lonliness',
    'Calm',
    'Joy',
    'Bored',
    'Cheerful',
  ];
  static List<Activity> funActivities = [
    Activity(
        color: colors[0],
        activitySuggestion: 'A dance',
        icon: Icons.directions_walk,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[1],
        activitySuggestion: 'A doodle',
        icon: Icons.landscape,
        curves: Curves.ease,
        imageUrl: 'images/paint.png'),
    Activity(
        color: Color(0xFFFF9AA2),
        activitySuggestion: 'Netflix',
        icon: Icons.movie,
        curves: Curves.ease,
        imageUrl: 'images/cake.png'),
    Activity(
        color: colors[3],
        activitySuggestion: 'Paint',
        icon: Icons.format_paint,
        curves: Curves.ease,
        imageUrl: 'images/paint.png'),
    Activity(
        color: colors[4],
        activitySuggestion: 'Light a scented candle',
        icon: Icons.lightbulb_outline,
        curves: Curves.ease,
        imageUrl: 'images/paint.png'),
    Activity(
        color: colors[5],
        activitySuggestion: 'party',
        icon: Icons.party_mode,
        curves: Curves.ease,
        imageUrl: 'images/paint.png'),
    Activity(
        color: colors[6],
        activitySuggestion: 'Have a burger',
        icon: Icons.fastfood,
        curves: Curves.ease,
        imageUrl: 'images/paint.png'),
    Activity(
        color: colors[0],
        activitySuggestion: 'Do jogging',
        icon: Icons.directions_run,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[1],
        activitySuggestion: 'Music...',
        icon: Icons.music_note,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[2],
        activitySuggestion: 'Read a Book',
        icon: Icons.book,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[3],
        activitySuggestion: 'Speak to your bestie',
        icon: Icons.person_pin,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[4],
        activitySuggestion: 'A video call to mom',
        icon: Icons.person_outline,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[5],
        activitySuggestion: 'Going on a Drive',
        icon: Icons.drive_eta,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[1],
        activitySuggestion: 'A quick warm up',
        icon: Icons.directions_run,
        curves: Curves.ease,
        imageUrl: 'images/exercise.png'),
    Activity(
        color: colors[3],
        activitySuggestion: 'Have a coffee',
        icon: Icons.local_drink,
        curves: Curves.easeInBack,
        imageUrl: 'images/drink.png'),
    Activity(
        color: colors[2],
        activitySuggestion: 'Take a short nap',
        icon: Icons.snooze,
        curves: Curves.easeIn,
        imageUrl: 'images/nap.png'),
    Activity(
        color: colors[3],
        activitySuggestion: 'A doodle',
        icon: Icons.landscape,
        curves: Curves.easeInToLinear,
        imageUrl: 'images/paint.png'),
    Activity(
        color: colors[4],
        activitySuggestion: 'Watering plants',
        icon: Icons.nature_people,
        curves: Curves.easeInBack,
        imageUrl: 'images/growth.png'),
    Activity(
        color: colors[5],
        activitySuggestion: 'Bake a cake',
        icon: Icons.cake,
        curves: Curves.easeInExpo,
        imageUrl: 'images/cake.png'),
    Activity(
        color: colors[6],
        activitySuggestion: 'doing a self care',
        icon: Icons.face,
        curves: Curves.easeInExpo,
        imageUrl: 'images/cosmetics.png'),
  ];

  static Activity generateQuestion(int questionNumber) {
    activityNumber = _generateRandomActivity();
    if (questionNumber < funActivities.length)
      return funActivities[activityNumber];
    else
      return Activity(
          activitySuggestion: 'Oh no! Please try me again....',
          color: Colors.redAccent,
          icon: Icons.airplanemode_inactive);
  }

  //genarate random Number
  static int _generateRandomActivity() {
    return Random().nextInt(funActivities.length);
  }
}

class Activity {
  String activitySuggestion;
  IconData icon;
  Color color;
  Cubic curves;
  String imageUrl;

  Activity(
      {this.color,
      this.icon,
      this.activitySuggestion,
      this.curves,
      this.imageUrl});
}
