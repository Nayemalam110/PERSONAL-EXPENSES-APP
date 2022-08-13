import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addlist;

  const NewTransaction(this.addlist, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  late DateTime selectedate;

  void datepiker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022, 1, 1),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedate = value;
      });
    });
  }

  void submitData() {
    final enteredtitle = titlecontroller.text;
    final enteredamounth = double.parse(amountcontroller.text);

    if (enteredtitle.isEmpty || enteredamounth <= 0) {
      return;
    }

    widget.addlist(
      enteredtitle,
      enteredamounth,
      selectedate,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: datepiker, child: const Text('Choose date')),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Add'),
            ),
          ],
        ));
  }
}
