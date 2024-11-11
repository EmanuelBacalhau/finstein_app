import 'package:finstein_app/constants/app_color.dart';
import 'package:finstein_app/pages/home/widgets/button_tab_bar.dart';
import 'package:finstein_app/pages/home/widgets/expense_item.dart';
import 'package:finstein_app/pages/home/widgets/expenses_title.dart';
import 'package:finstein_app/pages/home/widgets/progress_expenses.dart';
import 'package:finstein_app/repositories/expenses_repository.dart';
import 'package:finstein_app/repositories/month_repository.dart';
import 'package:finstein_app/widgets/layout_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _monthSelected = 1;
  double _totalValue = 0.0;
  MonthRepository monthRepository = MonthRepository();
  ExpensesRepository expensesRepository = ExpensesRepository();

  double get total => _totalValue;
  set total(double value) {
    setState(() {
      _totalValue = value;
    });
  }

  int totalExpensesPaid = 0;
  int totalExpenses = 0;

  void _onMonthSelected(int monthId) {
    setState(() {
      _monthSelected = monthId;
      total = expensesRepository
          .getAllByMonth(_monthSelected)
          .fold(0, (prev, element) => prev + element.getValue);
      totalExpensesPaid =
          expensesRepository.getTotalExpensesPaidByMonth(monthId);
      totalExpenses = expensesRepository.getAllByMonth(monthId).length;
    });
  }

  @override
  void initState() {
    super.initState();
    total = expensesRepository
        .getAllByMonth(_monthSelected)
        .fold(0, (prev, element) => prev + element.getValue);
    totalExpensesPaid =
        expensesRepository.getTotalExpensesPaidByMonth(_monthSelected);
    totalExpenses = expensesRepository.getAllByMonth(_monthSelected).length;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: monthRepository
                  .getAll()
                  .map(
                    (month) => Row(
                      children: [
                        ButtonTabBar(
                          onPressed: () => _onMonthSelected(month.id),
                          title: month.name,
                          isSelected: month.id == _monthSelected,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            padding: const EdgeInsets.all(40),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  AppColor.lightBlue,
                  AppColor.mediumBlue,
                  AppColor.darkBlue,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ProgressExpenses(
                  totalPaid: totalExpensesPaid,
                  totalExpenses: totalExpenses,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const ExpensesTitle(),
          Flexible(
            fit: FlexFit.tight,
            child: ListView(
              shrinkWrap: true,
              children: expensesRepository
                  .getAllByMonth(_monthSelected)
                  .map(
                    (expense) => ExpenseItem(item: expense),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
