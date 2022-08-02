import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';

class NewTransaction extends StatelessWidget {
  Function addlist;
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  NewTransaction(this.addlist);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                addlist(
                  titlecontroller.text,
                  double.parse(amountcontroller.text),
                );
              },
            )
          ],
        ));
  }
}
