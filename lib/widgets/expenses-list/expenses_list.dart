import 'package:app3/widgets/expenses-list/expenses_item.dart';
import 'package:flutter/material.dart';

import 'package:app3/models/expense.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key, required this.expenses, required this.onRemoveExpense}) : super(key: key);

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length ,itemBuilder: (ctx, index) => Dismissible(
      background: Container(
        color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        margin: Theme.of(context).cardTheme.margin,
      ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index])));
  }
}
