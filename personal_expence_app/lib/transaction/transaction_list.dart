import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';

import 'package:intl/intl.dart';

class Transaction_list extends StatelessWidget {
  final List<Transaction> transaction;

  Transaction_list(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transaction.isEmpty
          ? Text('No data')
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${transaction[index].amount.toStringAsFixed(2)}',
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(transaction[index].title),
                                Text(DateFormat.yMd()
                                    .format(transaction[index].date)),
                              ],
                            )
                          ]),
                    ),
                  ),
                );
              }),
    );
  }
}
