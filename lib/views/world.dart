import 'package:covid19/animation/bottomAnimation.dart';
import 'package:covid19/customWidgets/customLoader.dart';
import 'package:covid19/customWidgets/globalListTile.dart';
import 'package:covid19/model/globalDataModel.dart';
import 'package:flutter/material.dart';
import 'package:covid19/controller/covidAPI.dart';
import 'package:intl/intl.dart';

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.02),
      width: width,
      height:height,
      child: Stack(
        children: <Widget>[
          Text(
            "\tGlobal COVID-19",
            style: TextStyle(
                fontSize: height * 0.04,
                fontWeight: FontWeight.w200,
                fontFamily: 'MyFont'),
          ),
          GlobalDataList()
        ],
      ),
    );
  }
}

class GlobalDataList extends StatelessWidget {
  final formatter = NumberFormat("###,###");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: height * 0.07,
      child: FutureBuilder<GlobalData>(
        future: CovidAPI().getCase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int caseCount = int.parse(snapshot.data.cases);
            int deathCount = int.parse(snapshot.data.deaths);
            int recoveredCount = int.parse(snapshot.data.recovered);

            return Container(
              height: height,
              width: width * 0.95,
              child: ListView(
                children: <Widget>[
                  MainImage(),
                  SizedBox(height: height * 0.035),
                  WidgetAnimator(
                    GlobalListTile(
                      caseInfo: formatter.format(caseCount),
                      infoHeader: 'Cases',
                      cardColor: Colors.white,
                      titleColor: Colors.blueAccent,
                      assetImage: 'images/covidBlue.png',
                    ),
                  ),
                  WidgetAnimator(
                    GlobalListTile(
                      caseInfo: formatter.format(deathCount),
                      infoHeader: 'Deaths',
                      cardColor: Colors.white,
                      titleColor: Colors.red,
                      assetImage: 'images/death.png',
                    ),
                  ),
                  WidgetAnimator(
                    GlobalListTile(
                      caseInfo: formatter.format(recoveredCount),
                      infoHeader: 'Recoveries',
                      cardColor: Colors.white,
                      titleColor: Colors.green,
                      assetImage: 'images/recover.png',
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
                width: width,
                height: height * 0.4,
                child: Center(child: Text("${snapshot.error}")));
          }
          return Container(
            width: width,
            height: height * 0.4,
            child: Center(
              child: VirusLoader(),
            ),
          );
        },
      ),
    );
  }
}

class MainImage extends StatefulWidget {
  @override
  _MainImageState createState() => _MainImageState();
}

class _MainImageState extends State<MainImage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _animationController;

  toggleAnimation() {
    animation = Tween(begin: 0.0, end: 25.0).animate(_animationController);
    if (_animationController.isDismissed) {
      _animationController.forward().whenComplete(() => toggleAnimation());
    }
    if (_animationController.isCompleted) {
      _animationController.reverse().whenComplete(() => toggleAnimation());
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this)
      ..addListener(() => setState(() {}));
    toggleAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, animation.value),
      child: Column(
        children: <Widget>[
          Image.asset(
            'images/personFighting.png',
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Text(
            "Stay Home, Stay Safe!",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

