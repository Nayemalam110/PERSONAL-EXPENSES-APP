import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  Function addlist;

  NewTransaction(this.addlist);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitData() {
    final enteredtitle = titlecontroller.text;
    final enteredamounth = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamounth <= 0) {
      return;
    }

    widget.addlist(
      enteredtitle,
      enteredamounth,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text('Add'),
              onPressed: submitData,
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
            ),
          ],
        ));
  }
}
