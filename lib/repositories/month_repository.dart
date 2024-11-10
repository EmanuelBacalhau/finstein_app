import 'package:finstein_app/models/month.dart';

class MonthRepository {
  final List<Month> months = [];

  MonthRepository() {
    _createMonths();
  }

  void _createMonths() {
    months.add(Month(
      name: 'January',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'February',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'March',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'April',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'May',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'June',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'July',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'August',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'September',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'October',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'November',
      id: months.length + 1,
    ));
    months.add(Month(
      name: 'December',
      id: months.length + 1,
    ));
  }

  List<Month> getAll() {
    return months;
  }
}
