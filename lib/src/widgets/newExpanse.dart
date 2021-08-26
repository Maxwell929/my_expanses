
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpanse extends StatefulWidget {

  final Function addExpanses;

  NewExpanse(this.addExpanses);

  @override
  _NewExpanseState createState() => _NewExpanseState();
}

class _NewExpanseState extends State<NewExpanse> {

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectDate;



  void submitExpanse() {
    if (nameController.text.isEmpty) {
      return;
    }


    final enteredType = nameController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredType.isEmpty || enteredAmount <= 0 || selectDate == null) {
      return;
    }

    widget.addExpanses(
      enteredType,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectDate = pickedDate;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: nameController,
              onSubmitted: (_) => submitExpanse(),
            ),
            TextField(
              controller: amountController,
              onSubmitted: (_) => submitExpanse(),
              keyboardType: TextInputType.numberWithOptions(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(

                    child: Text(
                      selectDate == null
                          ? 'No Date Chosen'
                          : DateFormat.yMd().format(selectDate!),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: TextButton(
                      onPressed: presentDatePicker,
                      child: Text('Chose date'),
                      style: TextButton.styleFrom(
                        primary: Theme
                            .of(context)
                            .primaryColorDark,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add Expanse'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.pink,
                primary: Theme
                    .of(context)
                    .accentColor,
                shadowColor: Colors.blue,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: submitExpanse,
            ),
          ],
        ),
      ),
    );
  }
}
