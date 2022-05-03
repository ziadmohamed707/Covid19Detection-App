import 'package:covid19/animation/faderAnimation.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  AnimationController _controllerImage;
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 7000),
      vsync: this,
    );
    _controllerImage = new AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this)
      ..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 25.0).animate(_controllerImage);
    _controllerImage.repeat();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerImage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * 0.2,
              child: EntranceFader(
                delay: Duration(milliseconds: 500),
                duration: Duration(seconds: 5),
                offset: Offset(0, 1000),
                child: Opacity(
                  opacity: 0.5,
                  child: RotationTransition(
                    turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
                    child: Image.asset(
                      'images/covidBlue.png',
                      height: height * 0.22,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.3,
              right: -width * 0.5,
              child: EntranceFader(
                delay: Duration(milliseconds: 500),
                duration: Duration(seconds: 8),
                offset: Offset(-width - 50, height * 0.2),
                child: Opacity(
                  opacity: 0.5,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: Image.asset(
                      'images/covidRed.png',
                      height: height * 0.18,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.5,
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Image.asset(
                    'images/covidGreen.png',
                    height: height * 0.2,
                  ),
                ),
              ),
            ),
            Center(
              child: AppInfo(),
            )
          ],
        ));
  }
}

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Coronavirus",
          style: TextStyle(fontFamily: 'MyFont', fontSize: height * 0.04),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        CircleAvatar(
          maxRadius: height * 0.180,
          backgroundColor: Colors.orangeAccent,
          child: CircleAvatar(
            maxRadius: height * 0.17,
            backgroundImage: AssetImage('images/cov.png'),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text("Covid-19 Detictor \n & \n Covid-19 Tracker",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: height * 0.03,
              fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        SizedBox(
          height: height * 0.03,
        ),


      ],
    );
  }
}
