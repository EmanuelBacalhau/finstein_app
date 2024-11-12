import 'package:finstein_app/models/expense.dart';

class ExpensesRepository {
  final List<Expense> expenses = [];

  ExpensesRepository() {}

  List<Expense> getAll() {
    return expenses;
  }

  Expense getById(int id) {
    return expenses.firstWhere((element) => element.id == id);
  }

  List<Expense> getAllByMonth(int monthId) {
    return expenses.where((element) => element.getMonthId == monthId).toList();
  }

  int getTotalExpensesPaidByMonth(int monthId) {
    return expenses
        .where((element) => element.getIsPaid && monthId == element.getMonthId)
        .length;
  }

  void add({
    required String title,
    required String description,
    required int monthId,
    required double value,
  }) {
    Expense newExpense = Expense(
      id: expenses.length + 1,
      title: title,
      description: description,
      monthId: monthId,
      value: value,
      isPaid: false,
    );

    expenses.add(newExpense);
  }

  void remove(int id) {
    Expense expense = expenses.firstWhere((element) => element.id == id);
    expenses.remove(expense);
  }

  void update(
    int id, {
    String? title,
    String? description,
    int? monthId,
    double? value,
    bool? isPaid,
  }) {
    final index = expenses.indexWhere((element) => element.id == id);
    Expense expense = expenses[index];

    Expense newExpense = Expense(
      id: id,
      title: title ?? expense.getTitle,
      description: description ?? expense.getDescription,
      monthId: monthId ?? expense.getMonthId,
      value: value ?? expense.getValue,
      isPaid: isPaid ?? expense.getIsPaid,
    );

    expenses[index] = newExpense;
  }
}
