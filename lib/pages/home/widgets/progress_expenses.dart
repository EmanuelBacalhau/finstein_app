import 'package:flutter/material.dart';

class ProgressExpenses extends StatelessWidget {
  final int totalPaid;
  final int totalNoPaid;
  final int totalExpenses;

  const ProgressExpenses({
    super.key,
    required this.totalPaid,
    required this.totalExpenses,
    required this.totalNoPaid,
  });

  double percentagePaid() {
    if (totalPaid == 0 || totalExpenses == 0) {
      return 0;
    }
    return ((totalPaid - totalNoPaid / totalExpenses));
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
          '${(percentagePaid() * 100).toStringAsFixed(2)}% expenses paid',
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
