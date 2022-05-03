import 'package:flutter/material.dart';

class GlobalListTile extends StatelessWidget {
  final String caseInfo;
  final String infoHeader;
  final Color cardColor;
  final Color titleColor;
  final String assetImage;
  GlobalListTile(
      {this.caseInfo, this.infoHeader, this.cardColor,this.titleColor, this.assetImage});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      color: cardColor,
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.1),
          width: width,
          height: height * 0.14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Global",
                    style: TextStyle(
                        color: titleColor,
                        fontSize: height * .015,
                        fontFamily: 'MyFont'),
                  ),
                  Text("Total $infoHeader",
                      style: TextStyle(
                          fontFamily: 'MyFont',
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.025)),
                  Text(caseInfo,
                      style: TextStyle(
                          fontFamily: 'MyFont',
                          color: titleColor,
                          fontSize: height * 0.025))
                ],
              ),
              Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "$assetImage",
                    height: height * 0.1,
                  ),),
            ],
          )),
    );
  }
}
