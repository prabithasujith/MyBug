import 'package:flutter/material.dart';
import 'package:mybug/idea_model.dart';

class ActivityAccepted extends StatefulWidget {
  static const String route = '/activityAccepted';
  @override
  _ActivityAcceptedState createState() => _ActivityAcceptedState();
}

class _ActivityAcceptedState extends State<ActivityAccepted> {
  Activity _activity;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _activity = args['activity'];

    return Scaffold(
        backgroundColor: _activity.color,
        appBar: AppBar(
          backgroundColor: _activity.color,
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Hero(
                tag: 'myBug',
                child: Container(
                  height: 100,
                  child: Icon(
                    Icons.bug_report,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),



            ),


            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text('Hey that\'s great...\nCome on, Cheer Up and have a good day!',
              style: TextStyle(fontSize: 30,color: Colors.white),
              ),)),

              Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text('Lets catch again..',
              style: TextStyle(fontSize: 30,color: Colors.white),
              ),))
          ],
        ));
  }
}
