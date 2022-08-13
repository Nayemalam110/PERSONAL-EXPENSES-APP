import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String label;
  double sendeingAmouth;
  double sepedingPracetage;

  ChartBar(this.label, this.sendeingAmouth, this.sepedingPracetage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Container(
          height: 60,
          width: 10,
          color: Colors.green,
          child: Stack(
            children: [
              Container(
                color: Colors.red,
              ),
              FractionallySizedBox(
                heightFactor: (1 - sepedingPracetage),
                child: Container(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Text(
          '$sendeingAmouth',
        ),
      ],
    );
  }
}
