import 'package:flutter/material.dart';
import 'package:first2/pages/home.dart';
import 'package:rive/rive.dart';

class Result extends StatefulWidget {
  //final int BMI;

  // Result({Key key, this.BMI}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    double roundeddata = double.parse(data["BMI"].toStringAsFixed(1));
    String klasse = data["klasse"].toString();
    print(data);
    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${klasse}",style: TextStyle(fontSize: 30),
          ),
          Container(
            child: getAsset(),
            width: 500,
            height: 500,
          ),
          Text("Din BMI",
          style: TextStyle(fontSize: 25),),
          Text(
              "${roundeddata}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ))),
    );
  }

  Widget getAsset() {
    if (data['BMI'] > 25) {
      return Container(
        child: RiveAnimation.asset(
          "assets/man.riv",
          animations: ["Animation 1"],
        ),
      );
    } else if(data['BMI']<18.5) {
      return Container(
        child: RiveAnimation.asset(
          "assets/man.riv",
          animations: ["Animation 3"],
        ),
      );
    }
    else
      {
        return Container(
           child: RiveAnimation.asset(
           "assets/man.riv",
          animations: ["Animation 2"],
           ),
        );
      }
  }
}
