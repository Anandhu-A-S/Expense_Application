import 'package:expense_application/models/expense.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseAdd extends StatefulWidget {
  ExpenseAdd({super.key, required this.addFunction});
  final void Function(Expense expense) addFunction;
  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final _titleController = TextEditingController();
  final _moneyController = TextEditingController();
  double? amount = 0;

  DateTime? selectedDate;
  Category categoryItem = Category.lesiure;
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

  void _expenseAddFunction() {
    final amountValidity =
        double.tryParse(_moneyController.text.trim()) == null;
    if (_titleController.text.trim().isEmpty ||
        amountValidity ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Fill all fields"),
          content: const Text("Fill all the fields "),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("okey"))
          ],
        ),
      );
      return;
    }

    amount = double.tryParse(_moneyController.text);

    widget.addFunction(Expense(
        title: _titleController.text,
        amount: amount!,
        dateTime: selectedDate!,
        category: categoryItem));
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
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              DropdownButton(
                  value: categoryItem,
                  items: Category.values.map((value) {
                    return DropdownMenuItem(
                        value: value, child: Text(value.name.toUpperCase()));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      categoryItem = value;
                    });
                  }),
              const Spacer(),
              OutlinedButton(
                onPressed: _expenseAddFunction,
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
