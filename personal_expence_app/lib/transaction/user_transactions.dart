import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';
import 'package:personal_expence_app/transaction/new_transaction.dart';
import 'package:personal_expence_app/transaction/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      amount: 1200,
      date: DateTime.now(),
      id: 't1',
      title: 'New shoes',
    ),
    Transaction(
      amount: 1100,
      date: DateTime.now(),
      id: 't2',
      title: 'New cloths',
    ),
  ];

  addlist(title, double amount) {
    final addList = Transaction(
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
      title: title,
    );
    setState(() {
      _userTransaction.add(addList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            NewTransaction(addlist),
            Transaction_list(_userTransaction),
          ],
        ));
  }
}
