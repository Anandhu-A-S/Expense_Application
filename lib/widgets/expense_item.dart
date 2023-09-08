import 'package:expense_application/models/expense.dart';

import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});
  final Expense expenseItem;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(expenseItem.title),
        Row(
          children: [
            Text("\$${expenseItem.amount.toStringAsFixed(2)}"),
            const Spacer(),
            Row(
              children: [
                Icon(categoryIcons[expenseItem.category]),
                Text(expenseItem.formattedDateTime)
              ],
            )
          ],
        )
      ],
    ));
  }
}
