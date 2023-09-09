import 'package:expense_application/models/expense.dart';
import 'package:expense_application/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(this.expenseList, {super.key});
  final List<Expense> expenseList;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.expenseList.length,
        itemBuilder: ((context, index) =>
            ExpenseItem(widget.expenseList[index])));
  }
}
