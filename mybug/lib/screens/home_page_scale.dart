import 'package:flutter/material.dart';
import 'package:mybug/models/idea_model.dart';
import 'package:mybug/screens/mood_selection.dart';
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
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Hello friend !!\n ',
                style: Theme.of(context).textTheme.caption),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        _isFirstQuestion
                      ? SizedBox()
                      : Align(
                        alignment: Alignment.topLeft,
                                              child: MaterialButton(
                           height: 20,
                            onPressed: () {
                              _isFirstQuestion = true;
                              setState(() {});
                            },
                            splashColor: Colors.white,
                            // child: Text('Back',
                            //     style: Theme.of(context).textTheme.display1)

                            child: Icon(Icons.arrow_back,color: Colors.white,size: 40,),
                                
                                ),
                      ),
                      Column(
                        children: <Widget>[
                         
                  
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0.0, 10, 0.0, 10.0),
                              child: Text(
                                _isFirstQuestion
                                    ? 'How energized are you?'
                                    : 'How pleasant are you\nfeeling?',
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.center,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
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
                              Slider(
                                value: _isFirstQuestion
                                    ? _isEnergized
                                    : _isPleasant,
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
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                
                  MaterialButton(
                      color: Colors.white12,
                      onPressed: () {
                        if (_isFirstQuestion) {
                          _isFirstQuestion = false;
                          _isPleasant = 0.0;
                          setState(() {});
                        } else {
                          if (_isEnergized < 50.0)
                            IdeasModel.energyLevel = EnergyScale.DULL;
                          else
                            IdeasModel.energyLevel = EnergyScale.ENERGIZED;

                          if (_isPleasant < 50.0)
                            IdeasModel.pleasantLevel = EnergyScale.UNPLEASANT;
                          else
                            IdeasModel.pleasantLevel = EnergyScale.PLEASANT;

                          IdeasModel.generateUserEmotionList();
                          Navigator.of(context).pushNamed(MoodSelection.route);
                        }
                      },
                      splashColor: Colors.white,
                      child: Text('Next',
                          style: Theme.of(context).textTheme.button))
                ],
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
      ),
    );
  }
}
