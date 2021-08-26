import 'package:flutter/material.dart';
import 'package:my_expanses/src/widgets/expanseList.dart';
import './../models/expanse.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Expanse> myExpanse = [
    Expanse(
      id: 'e1',
      name: "Billa",
      amount: 250.22,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ExpansesList(myExpanse),
    );
  }
}
