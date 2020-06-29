import 'package:flutter/material.dart';
import 'package:mybug/home_page.dart';
import 'package:mybug/idea_model.dart';
import 'package:mybug/widgets/curvePainter.dart';

class MoodSelection extends StatefulWidget {
  static const String route = '\route';
  @override
  _MoodSelectionState createState() => _MoodSelectionState();
}

class _MoodSelectionState extends State<MoodSelection> {
  bool accepted = false;
  bool drop = false;

  var _addedMoods = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.redAccent[100],
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          margin: EdgeInsets.only(top: 40, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(5),
                child: Text(
                  'Tell me what you feel like',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                  height: 300,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      String mood = IdeasModel.userEmotionsList[i];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white24, width: 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          margin: EdgeInsets.only(left: 10),
                          color: (_addedMoods.contains(mood))
                              ? Colors.white
                              : Colors.white12,
                          child: InkWell(
                              hoverColor: (_addedMoods.contains(mood))
                                  ? Colors.white12
                                  : Colors.white,
                              onTap: () {
                                // IdeasModel.currentMood = IdeasModel.myMood[i];
                                // Navigator.of(context)
                                //     .pushNamed(MyHomePage.route);
                                if (_addedMoods.contains(mood))
                                  _addedMoods.remove(mood);
                                else
                                  _addedMoods.add(mood);
                                setState(() {});
                              },
                              child: Row(
                                mainAxisAlignment: (_addedMoods.contains(mood))
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(right: 5, left: 5),
                                      alignment: Alignment.centerRight,
                                      height: 80,
                                      child: Text(
                                        IdeasModel.userEmotionsList[i],
                                        textAlign: (_addedMoods.contains(mood))
                                            ? TextAlign.end
                                            : TextAlign.left,
                                        style: TextStyle(
                                            color: (_addedMoods.contains(mood))
                                                ? Colors.redAccent
                                                : Colors.white,
                                            fontSize: 30,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w300),
                                      )),
                                ],
                              )),
                        ),
                      );
                    },
                    itemCount: IdeasModel.userEmotionsList.length,
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.redAccent,
                child: Text(
                  'Lets Go',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: () {
                  IdeasModel.userSelectedEmotionList.clear();

                  _addedMoods.forEach((value) {
                    IdeasModel.userEmotionsList.add(value);
                  });

                  Navigator.of(context).pushNamed(MyHomePage.route);
                },
              ),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 40,
                      child: CustomPaint(
                        painter: CurvePainter(),
                        child: Container(),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Hero(
                        tag: 'myBug',
                        child: Icon(
                          Icons.bug_report,
                          size: 40,
                          color: Colors.white,
                        ),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
