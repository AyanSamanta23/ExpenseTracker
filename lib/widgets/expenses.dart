

import 'dart:math';

import 'package:app3/widgets/chart/chart.dart';
import 'package:app3/widgets/expenses-list/expenses_list.dart';
import 'package:app3/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';


class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);


  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter Course', amount: 4000, date: DateTime.now(), category: Category.work ),
    Expense(title: 'Cinema', amount: 500 , date: DateTime.now(), category: Category.leisure ),
  ];

  void _openAddExpense()
  {
      showModalBottomSheet(context: context,
          useSafeArea: true,
          isScrollControlled: true,
          builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense)
  {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense)
  {
    final expense_index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('Expense deleted'),

          action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {
                  _registeredExpenses.insert(expense_index, expense);
                });
              }),

        ));
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    Widget mainContent =  const Center(
      child: Text('No expenses found. Start adding some!'),);

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense,)  ;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense tracker'),
        actions: [
          IconButton(onPressed: _openAddExpense,
              icon: const Icon(Icons.add))
        ],
      ),
      body: Width < 600 ? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent)
        ],
      ): Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
