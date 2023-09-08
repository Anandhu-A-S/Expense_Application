import 'package:expense_application/widgets/expense_add.dart';
import 'package:expense_application/widgets/expense_list.dart';
import 'package:flutter/material.dart';

import 'package:expense_application/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registedExpenses = [
    Expense(
      title: 'flutter application',
      amount: 19.99,
      dateTime: DateTime.parse("2023-05-23 08:56:23"),
      category: Category.work,
    ),
    Expense(
      title: 'biriyani',
      amount: 10.00,
      dateTime: DateTime.parse("2023-05-23 08:56:23"),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void addbuttonExpand() {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return const ExpenseAdd();
          });
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Expense Application"),
            actions: [
              IconButton(
                  onPressed: addbuttonExpand, icon: const Icon(Icons.add))
            ],
          ),
          body: Center(
            child: ExpenseList(_registedExpenses),
          )),
    );
  }
}
