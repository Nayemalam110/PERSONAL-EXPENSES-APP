import 'package:flutter/material.dart';
import 'package:personal_expence_app/Chart/chart.dart';

import 'package:personal_expence_app/models/transaction.dart';
import 'package:personal_expence_app/transaction/new_transaction.dart';
import 'package:personal_expence_app/transaction/transaction_list.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(const MyExpensesApp());
}

class MyExpensesApp extends StatelessWidget {
  const MyExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
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
          colorScheme: const ColorScheme.dark(),
          primaryColor: Colors.black,
        )));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  addlist(title, double amount, DateTime selectedDate) {
    final addList = Transaction(
      amount: amount,
      date: selectedDate,
      id: DateTime.now().toString(),
      title: title,
    );
    setState(() {
      _userTransaction.add(addList);
    });
  }

  deletelist(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  void _showModelSheet(BuildContext ctx) {
    showBarModalBottomSheet(
      context: ctx,
      builder: (_) {
        return SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).viewInsets.bottom + 300,
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
                child: Chart(_recenttransactions),
              ),
              TransactionList(_userTransaction, deletelist),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showModelSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
