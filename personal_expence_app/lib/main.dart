import 'package:flutter/material.dart';
import 'package:personal_expence_app/transaction/user_transactions.dart';

void main() {
  runApp(const MyExpensesApp());
}

class MyExpensesApp extends StatelessWidget {
  const MyExpensesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
        ),
        body: Card(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.amber,
                child: const Card(
                  child: Text('Card 1'),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
