import 'package:flutter/material.dart';
import 'package:my_expanses/src/widgets/expanseList.dart';
import 'package:my_expanses/src/widgets/newExpanse.dart';
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

  void addNewExpanse(String expType, double espAmount, DateTime chosenDate) {
    final newExpanse = Expanse(
        name: expType,
        amount: espAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      myExpanse.add(newExpanse);
    });
  }


  void startAddExpanse(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewExpanse(addNewExpanse),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansesList(myExpanse),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>{startAddExpanse(context)},
      ),
    );
  }
}
