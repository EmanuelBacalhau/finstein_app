import 'package:finstein_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense item;
  const ExpenseItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: item.getIsPaid ? Colors.green.shade600 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.getTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: item.getIsPaid ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  '\$ ${item.getValue.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: item.getIsPaid ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              item.getDescription,
              style: TextStyle(
                fontSize: 12,
                color: item.getIsPaid ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}