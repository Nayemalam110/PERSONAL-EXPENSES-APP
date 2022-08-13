import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double sendeingAmouth;
  final double sepedingPracetage;

  const ChartBar(this.label, this.sendeingAmouth, this.sepedingPracetage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            child: Text('\$${sendeingAmouth.toStringAsFixed(0)}'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          color: Colors.green,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: (1 - sepedingPracetage),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}
