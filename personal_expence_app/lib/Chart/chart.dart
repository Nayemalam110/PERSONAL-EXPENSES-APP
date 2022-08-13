import 'package:flutter/material.dart';
import 'package:personal_expence_app/Chart/chart_bar.dart';
import 'package:personal_expence_app/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recenttransaction;
  Chart(this._recenttransaction);

  List<Map<String, Object>> get groupTrasection {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalAmount = 0.00;
      for (var i = 0; i < _recenttransaction.length; i++) {
        if (_recenttransaction[i].date.day == weekday.day &&
            _recenttransaction[i].date.month == weekday.month &&
            _recenttransaction[i].date.year == weekday.year) {
          totalAmount += _recenttransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalAmount,
      };
    });
  }

  double get totalspending {
    return groupTrasection.fold(0.0, (previousValue, element) {
      return previousValue + double.parse(element['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTrasection);
    print(totalspending);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: groupTrasection.map((e) {
        return ChartBar(
          e['day'] as String,
          e['amount'] as double,
          (e['amount'] as double) / totalspending,
        );
      }).toList(),
    );
  }
}
