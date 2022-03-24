import 'dart:math';

import 'package:first2/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int weight = 60;
  int height = 150;

  double bmi = 0;
  String type = "test";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "BMI udregner",
                  style: TextStyle(fontSize: 40, fontFamily: 'Lato'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Vælg din vægt i kg",
              style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
            ),
            NumberPicker(
                minValue: 30,
                maxValue: 300,
                value: weight,
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                }),
            Text(
              'Din vægt: $weight kg',
              style: TextStyle(fontFamily: 'Lato'),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
                thickness: 0.1,
              ),
            ),
            const Text(
              "Vælg din højde i cm",
              style: TextStyle(fontSize: 20, fontFamily: 'Lato'),
            ),
            NumberPicker(
                minValue: 100,
                maxValue: 250,
                value: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                }),
            Text(
              'Din højde: $height cm',
              style: TextStyle(fontFamily: 'Lato'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    bmi = weight / pow((height / 100), 2);
                  });

                  if (bmi > 25) {
                    type = "Overvægtig";
                  }
                  else if(bmi<18.5)
                    {
                      type = "Undervægtig";
                    }
                      else
                        {
                          type = "Normalvægtig";
                        }

                  Navigator.pushNamed(context, '/Result',
                      arguments: {'BMI': bmi, 'klasse':type});
                },
                child: const Text('Udregn BMI'))
          ],
        ),
      ),
    );
  }
}
