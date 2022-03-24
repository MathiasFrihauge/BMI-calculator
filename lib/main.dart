

import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/result.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Lato'
    ),
   initialRoute: '/home',
    routes:{
   //   '/': (context) =>Home(),
      '/home': (context) => Home(),
      '/Result': (context) => Result()
    },
  ));
}


