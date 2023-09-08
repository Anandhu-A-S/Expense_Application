import 'package:expense_application/models/expense.dart';
import 'package:expense_application/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenseList, {super.key});
  final List<Expense> expenseList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: ((context, index) => ExpenseItem(expenseList[index])));
  }
}
