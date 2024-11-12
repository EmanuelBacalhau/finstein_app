import 'package:finstein_app/models/month.dart';
import 'package:finstein_app/repositories/month_repository.dart';
import 'package:finstein_app/widgets/basic_button.dart';
import 'package:finstein_app/widgets/basic_input.dart';
import 'package:finstein_app/widgets/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class CreateExpense extends StatefulWidget {
  final Function({
    required String title,
    required String description,
    required int monthId,
    required double value,
  }) _onCreateExpense;

  const CreateExpense(
      {super.key,
      required Function({
        required String title,
        required String description,
        required int monthId,
        required double value,
      }) onCreateExpense})
      : _onCreateExpense = onCreateExpense;

  @override
  State<CreateExpense> createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  final MonthRepository _monthRepository = MonthRepository();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  int _monthSelected = 1;

  final _formKey = GlobalKey<FormState>();

  void _onMonthSelected(int monthId) {
    setState(() {
      _monthSelected = monthId;
    });
  }

  void _createExpense() {
    if (_formKey.currentState!.validate()) {
      String title = _titleController.text;
      String description = _descriptionController.text;
      double value = double.parse(_valueController.text);

      widget._onCreateExpense(
        title: title,
        description: description,
        monthId: _monthSelected,
        value: value,
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: const GradientAppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create expense',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  BasicInput(
                    labelText: 'Title',
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  BasicInput(
                    labelText: 'Description',
                    controller: _descriptionController,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DropdownMenu(
                    width: double.infinity,
                    label: const Text('Month'),
                    menuHeight: 200,
                    initialSelection: _monthRepository.getAll().first,
                    onSelected: (value) {
                      _onMonthSelected(value!.id);
                    },
                    dropdownMenuEntries: _monthRepository
                        .getAll()
                        .map<DropdownMenuEntry<Month>>((value) {
                      return DropdownMenuEntry(
                        label: value.name,
                        value: value,
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  BasicInput(
                    labelText: 'Value',
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  BasicButton(onPressed: _createExpense, title: 'Create'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
