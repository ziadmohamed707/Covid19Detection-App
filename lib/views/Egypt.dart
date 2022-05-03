import 'package:covid19/animation/bottomAnimation.dart';
import 'package:covid19/controller/covidAPI.dart';
import 'package:covid19/customWidgets/customLoader.dart';
import 'package:covid19/customWidgets/homeTile.dart';
import 'package:covid19/model/homeCountryDataModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Egypt extends StatefulWidget {
  @override
  _EgyptState createState() => _EgyptState();
}

class _EgyptState extends State<Egypt> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    return SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flag(),
              FutureBuilder<HomeStats>(
                future: CovidAPI().getHomeCase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print("object");
                    return Container(
                      height: height * 0.4155,
                      child: Center(
                        child: VirusLoader(),
                      ),
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Last Update: $formattedDate",
                              style: TextStyle(
                                  fontFamily: 'MyFont',
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Icon(Icons.refresh))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.cases,
                                infoHeader: 'Cases',
                                cardColor: Colors.white,
                                titleColor: Colors.blueAccent,
                              ),
                            ),
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.recovered,
                                infoHeader: 'Recoveries',
                                cardColor: Colors.white,
                                titleColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.deaths,
                                infoHeader: 'Deaths',
                                cardColor: Colors.white,
                                titleColor: Colors.redAccent,
                              ),
                            ),
                            WidgetAnimator(
                              HomeTile(
                                caseCount: snapshot.data.totalTests,
                                infoHeader: 'Tests',
                                cardColor: Colors.white,
                                titleColor: Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Text(
                          "keep Distance, Save Egypt!",
                          style: TextStyle(
                              fontFamily: 'MyFont', fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}

class Flag extends StatelessWidget {
  String emoji() {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;

    String country = "EG";

    int firstChar = country.codeUnitAt(0) - asciiOffset + flagOffset;
    int secondChar = country.codeUnitAt(1) - asciiOffset + flagOffset;

    String emoji =
        String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    return emoji;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "${emoji()}",
          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.1),
        ),
        Text(
          "EGYPT",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: MediaQuery.of(context).size.height * 0.05),
        ),
      ],
    );
  }
}
