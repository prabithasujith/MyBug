import 'package:flutter/material.dart';
import 'package:mybug/idea_model.dart';
import 'package:mybug/mood_selection.dart';
import 'package:mybug/widgets/curvePainter.dart';

class HomePageScale extends StatefulWidget {
  @override
  _HomePageScaleState createState() => _HomePageScaleState();
}

class _HomePageScaleState extends State<HomePageScale> {
  static const String route = '\homePageScale';
  double _isEnergized = 0.0;
  double _isPleasant = 0.0;
  bool _isFirstQuestion = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.redAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Container(
              height: 300,
              child: Card(
                color: Colors.white12,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white10, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(0.0, 10, 0.0, 10.0),
                            child: Text(
                              _isFirstQuestion
                                  ? 'How energized are you?'
                                  : 'How pleasant are you?',
                              style: Theme.of(context).textTheme.caption,
                            )),
                        Stack(
                          children: <Widget>[
                            Slider(
                              value:
                                  _isFirstQuestion ? _isEnergized : _isPleasant,
                              onChanged: (value) {
                                if (_isFirstQuestion)
                                  _isEnergized = value;
                                else
                                  _isPleasant = value;
                                setState(() {});
                              },
                              min: 0.0,
                              max: 100,
                              activeColor: Colors.white,
                              inactiveColor: Colors.white24,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: !((_isFirstQuestion)
                                        ? _isEnergized < 50.0
                                        : _isPleasant < 50.0)
                                    ? Colors.transparent
                                    : Colors.white,
                                radius: 30,
                                child: Image.asset(
                                  'images/sad.png',
                                  colorBlendMode: BlendMode.darken,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: CircleAvatar(
                                    backgroundColor: !((_isFirstQuestion)
                                            ? _isEnergized > 50.0
                                            : _isPleasant > 50.0)
                                        ? Colors.transparent
                                        : Colors.white,
                                    radius: 30,
                                    child: Image.asset('images/happy.png')))
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          _isFirstQuestion
                              ? SizedBox()
                              : FlatButton(
                                  onPressed: () {
                                    _isFirstQuestion = true;
                                    setState(() {});
                                  },
                                  splashColor: Colors.white,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                          FlatButton(
                              onPressed: () {
                                if (_isFirstQuestion) {
                                  _isFirstQuestion = false;
                                  _isPleasant = 0.0;
                                  setState(() {});
                                } else {
                                  if (_isEnergized < 50.0)
                                    IdeasModel.energyLevel = EnergyScale.DULL;
                                  else
                                    IdeasModel.energyLevel =
                                        EnergyScale.ENERGIZED;

                                  if (_isPleasant < 50.0)
                                    IdeasModel.pleasantLevel =
                                        EnergyScale.UNPLEASANT;
                                  else
                                    IdeasModel.pleasantLevel =
                                        EnergyScale.PLEASANT;

                                  IdeasModel.generateUserEmotionList();
                                  Navigator.of(context)
                                      .pushNamed(MoodSelection.route);
                                }
                              },
                              splashColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
    );
  }
}
