import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';
import 'package:personal_expence_app/transaction/user_transactions.dart';
import 'package:intl/intl.dart';

class Transaction_list extends StatelessWidget {
  final List<Transaction> transaction;

  Transaction_list(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: transaction.map((trx) {
        return Container(
          child: Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${trx.amount}',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(trx.title),
                        Text(DateFormat.yMd().format(trx.date)),
                      ],
                    )
                  ]),
            ),
          ),
        );
      }).toList(),
    ));
  }
}
