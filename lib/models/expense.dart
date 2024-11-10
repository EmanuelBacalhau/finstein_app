class Expense {
  final int _id;
  String _title;
  String _description;
  int _monthId;
  double _value;
  bool _isPaid;

  Expense({
    required int id,
    required String title,
    required String description,
    required int monthId,
    required double value,
    bool isPaid = false,
  })  : _id = id,
        _title = title,
        _description = description,
        _monthId = monthId,
        _value = value,
        _isPaid = isPaid;

  int get id => _id;
  String get getTitle => _title;
  String get getDescription => _description;
  int get getDate => _monthId;
  double get getValue => _value;
  bool get getIsPaid => _isPaid;
  int get getMonthId => _monthId;

  set setTitle(String value) {
    _title = value;
  }

  set setDescription(String value) {
    _description = value;
  }

  set setMonthId(int value) {
    _monthId = value;
  }

  set setValue(double value) {
    _value = value;
  }

  set setIsPaid(bool value) {
    _isPaid = value;
  }
}
