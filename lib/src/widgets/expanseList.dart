import 'package:flutter/material.dart';
import 'package:my_expanses/src/models/expanse.dart';

class ExpansesList extends StatelessWidget {
  final List<Expanse> expanses;

  ExpansesList(this.expanses);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: expanses.length,
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: 50,
                padding: EdgeInsets.all(12),
                child: Row(children: [
                  Container(
                    child: Text(
                      '${expanses[index].name.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('${expanses[index].amount}€'),
                  ),
                ]),
              ),
            );
          }),
    );
  }
}
