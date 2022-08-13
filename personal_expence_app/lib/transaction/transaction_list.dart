import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  final Function delete;

  const TransactionList(this.transaction, this.delete);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: transaction.isEmpty
          ? const Text('No data')
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 6,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text('${transaction[index].amount}')),
                    )),
                    title: Text(transaction[index].title),
                    subtitle:
                        Text(DateFormat.yMEd().format(transaction[index].date)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        delete(transaction[index].id);
                      },
                    ),
                  ),
                );
              }),
    );
  }
}
