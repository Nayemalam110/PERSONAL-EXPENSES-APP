import 'package:flutter/material.dart';
import 'package:personal_expence_app/models/transaction.dart';
import 'package:personal_expence_app/transaction/new_transaction.dart';
import 'package:personal_expence_app/transaction/transaction_list.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MaterialApp(
    home: MyExpensesApp(),
  ));
}

class MyExpensesApp extends StatefulWidget {
  @override
  State<MyExpensesApp> createState() => _MyExpensesAppState();
}

class _MyExpensesAppState extends State<MyExpensesApp> {
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
    Transaction(
      amount: 1100,
      date: DateTime.now(),
      id: 't2',
      title: 'New cloths',
    ),
    Transaction(
      amount: 1100,
      date: DateTime.now(),
      id: 't2',
      title: 'New cloths',
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

  void _showModelSheet(BuildContext ctx) {
    showBarModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          alignment: Alignment(0, 0),
          width: double.infinity,
          color: Color.fromARGB(255, 72, 100, 73),
          height: 500,
          child: NewTransaction(addlist),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.amber,
                child: const Card(
                  child: Text('New test'),
                ),
              ),
              Transaction_list(_userTransaction),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showModelSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
