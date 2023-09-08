import 'package:expense_application/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseAdd extends StatefulWidget {
  const ExpenseAdd({super.key});

  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final _titleController = TextEditingController();
  final _moneyController = TextEditingController();
  DateTime? selectedDate;
  final formatter = DateFormat.yMd();
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _moneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              icon: Icon(Icons.label),
              hintText: 'Enter the Title',
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _moneyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.money),
                    hintText: 'Enter the Amount',
                    label: Text('Amount'),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Spacer(),
                    Text(selectedDate == null
                        ? "Not selected"
                        : formatter.format(selectedDate!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month)),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_moneyController.text);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 5.0, color: Colors.blue),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 5.0, color: Colors.red),
                ),
                child: const Text(
                  'close',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
