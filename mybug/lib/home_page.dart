import 'package:flutter/material.dart';
import 'package:mybug/activity_accepted.dart';
import 'package:mybug/idea_model.dart';
import 'package:mybug/widgets/curvePainter.dart';

class MyHomePage extends StatefulWidget {
  static const String route = '/route';
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller, _iconController;
  Animation _animation;
  int questionNumber = 0;
  bool _animate = false;
  Activity _activity;
//accepted activity
  void onAcceptingActivity() {
    Navigator.of(context)
        .pushNamed(ActivityAccepted.route, arguments: {'activity': _activity});
  }

//declining activity
  void onDecliningActivity() {
    setState(() {
      _controller.reverse(from: 1.0);
    });

    questionNumber = questionNumber + 1;
    _activity = IdeasModel.generateQuestion(questionNumber);

    setState(() {
      _animate = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _activity = IdeasModel.generateQuestion(questionNumber);

    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2), upperBound: 100);

    _iconController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _iconController.forward();
    _animation = ColorTween(begin: Colors.white, end: Colors.white30)
        .animate(_iconController);

    _iconController.addListener(() {
      setState(() {});
      print(_animation.value);
      _iconController.repeat();
    });

    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Let me help !!'),
        backgroundColor: _activity.color,
      ),
      body: Container(
          decoration: BoxDecoration(color: _activity.color),
          child: Column(
            children: <Widget>[
              
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildExpandedIcons(Alignment.center),
                      buildExpandedIcons(Alignment.bottomRight)
                    ],
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  onEnd: () {
                    _animate = false;
                  },
                  height: 300,
                  width: _animate ? 100 : 400,
                  curve: Curves.linear,
                  duration: Duration(seconds: 2),
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.white12,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white10, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: _animate
                                ? Text('')
                                : Text(
                                   
                                        _activity.activitySuggestion 
                                        ,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.fade,
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildExpandedIcons(Alignment.center),
                      buildExpandedIcons(Alignment.bottomRight)
                    ],
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                            padding: EdgeInsets.all(2),
                            color: Colors.redAccent,
                            animationDuration: Duration(seconds: 1),
                            elevation: 2,
                            highlightColor: _animation.value,
                            textColor: Colors.white,
                            height: 50,
                            child: Text(
                              'No :(',
                            ),
                            onPressed: () {
                              onDecliningActivity();
                            }),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                              height: 50,
                              padding: EdgeInsets.all(2),
                              color: Colors.redAccent,
                              animationDuration: Duration(seconds: 1),
                              elevation: 2,
                              highlightColor: Colors.white,
                              textColor: Colors.white,
                              child: Text(
                                'YES, I can :)',
                              ),
                              onPressed: () {
                                onAcceptingActivity();
                              }),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Expanded buildExpandedIcons(Alignment alignment) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        alignment: alignment,
        child: Icon(
          _activity.icon,
          color: (_animation.value),
          size: 35,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _iconController.dispose();
    super.dispose();
  }
}
