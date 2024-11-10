import 'package:flutter/material.dart';

class ProgressExpenses extends StatelessWidget {
  final int totalPaid;
  final int totalExpenses;

  const ProgressExpenses({
    super.key,
    required this.totalPaid,
    required this.totalExpenses,
  });

  double percentagePaid() {
    if (totalPaid == 0 || totalExpenses == 0) {
      return 0;
    }
    return (totalPaid / totalExpenses);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        LinearProgressIndicator(
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
          value: percentagePaid(),
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation<Color>(
            Colors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${percentagePaid() * 100}% expenses paid',
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
