import 'package:flutter/material.dart';
import 'package:flutter_universe/inicio.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:'/',
      debugShowCheckedModeBanner: false,
      routes:<String, WidgetBuilder>{
          "/": (BuildContext context) => Inicio(), 
          "/home": (BuildContext context) => HomePage(),
        }
    );
  }
}