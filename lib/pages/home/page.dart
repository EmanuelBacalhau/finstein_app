import 'package:finstein_app/constants/app_color.dart';
import 'package:finstein_app/pages/create_expense/page.dart';
import 'package:finstein_app/pages/home/widgets/button_tab_bar.dart';
import 'package:finstein_app/pages/home/widgets/expense_item.dart';
import 'package:finstein_app/pages/home/widgets/progress_expenses.dart';
import 'package:finstein_app/repositories/expenses_repository.dart';
import 'package:finstein_app/repositories/month_repository.dart';
import 'package:finstein_app/widgets/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
  int totalExpensesNotPaid = 0;

  void _onMonthSelected(int monthId) {
    setState(() {
      _monthSelected = monthId;
      total = expensesRepository
          .getAllByMonth(_monthSelected)
          .fold(0, (prev, element) => prev + element.getValue);
      totalExpensesPaid =
          expensesRepository.getTotalExpensesPaidByMonth(monthId);
      totalExpenses = expensesRepository.getAllByMonth(monthId).length;
      totalExpensesNotPaid =
          expensesRepository.getTotalExpensesNotPaidByMonth(monthId);
    });
  }

  void _createExpense({
    required String title,
    required String description,
    required int monthId,
    required double value,
  }) {
    setState(() {
      expensesRepository.add(
        title: title,
        description: description,
        value: value,
        monthId: monthId,
      );

      total = expensesRepository
          .getAllByMonth(_monthSelected)
          .fold(0, (prev, element) => prev + element.getValue);
      totalExpensesPaid =
          expensesRepository.getTotalExpensesPaidByMonth(_monthSelected);
      totalExpenses = expensesRepository.getAllByMonth(_monthSelected).length;
      totalExpensesNotPaid =
          expensesRepository.getTotalExpensesNotPaidByMonth(_monthSelected);
    });
  }

  void _redirectCreateExpensePage() {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: CreateExpense(
          onCreateExpense: _createExpense,
        ),
      ),
    );
  }

  void _paidExpense(int id) {
    setState(() {
      expensesRepository.update(id, isPaid: true);
      total = expensesRepository
          .getAllByMonth(_monthSelected)
          .fold(0, (prev, element) => prev + element.getValue);
      totalExpensesPaid =
          expensesRepository.getTotalExpensesPaidByMonth(_monthSelected);
      totalExpensesNotPaid =
          expensesRepository.getTotalExpensesNotPaidByMonth(_monthSelected);
    });
  }

  void _deleteExpense(int id) {
    setState(() {
      expensesRepository.remove(id);
      total = expensesRepository
          .getAllByMonth(_monthSelected)
          .fold(0, (prev, element) => prev + element.getValue);
      totalExpensesPaid =
          expensesRepository.getTotalExpensesPaidByMonth(_monthSelected);
      totalExpensesNotPaid =
          expensesRepository.getTotalExpensesNotPaidByMonth(_monthSelected);
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
    totalExpensesNotPaid =
        expensesRepository.getTotalExpensesNotPaidByMonth(_monthSelected);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 4,
            ),
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
                const SizedBox(height: 16),
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
                  totalNoPaid: totalExpensesNotPaid,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Expenses',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: _redirectCreateExpensePage,
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            child: expensesRepository.getAllByMonth(_monthSelected).isEmpty
                ? const Text(
                    'No expenses found',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBDBDBD),
                    ),
                  )
                : ListView(
                    shrinkWrap: true,
                    children: expensesRepository
                        .getAllByMonth(_monthSelected)
                        .map(
                          (expense) => ExpenseItem(
                            item: expense,
                            onPaid: _paidExpense,
                            onDelete: _deleteExpense,
                          ),
                        )
                        .toList(),
                  ),
          )
        ],
      ),
    );
  }
}
