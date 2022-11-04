import 'package:beautyapp/ui/init_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitPage(title: 'Beauty App'),
    );
  }
}
