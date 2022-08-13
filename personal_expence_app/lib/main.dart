import 'package:flutter/material.dart';
import 'package:personal_expence_app/Chart/chart.dart';

import 'package:personal_expence_app/models/transaction.dart';
import 'package:personal_expence_app/transaction/new_transaction.dart';
import 'package:personal_expence_app/transaction/transaction_list.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(MyExpensesApp());
}

class MyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Home(),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.green,
          ),
          fontFamily: 'Quicksand',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(),
          primaryColor: Colors.black,
        )));
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   amount: 1200,
    //   date: DateTime.now(),
    //   id: 't1',
    //   title: 'New shoes',
    // ),
  ];

  List<Transaction> get _recenttransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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
          width: double.infinity,
          color: Color.fromARGB(255, 72, 100, 73),
          height: 300,
          child: NewTransaction(addlist),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses',
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.amber,
                child: Chart(_recenttransactions),
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
