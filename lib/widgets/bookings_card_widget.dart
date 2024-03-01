import 'package:flutter/material.dart';

class Transaction {
  final String accountSentTo;
  final String amountSent;
  final DateTime dateTime;

  Transaction({
    required this.accountSentTo,
    required this.amountSent,
    required this.dateTime,
  });
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Sent to: ${transaction.accountSentTo}'),
        subtitle: Text('Amount Sent: ${transaction.amountSent}\n'
            'Date & Time: ${transaction.dateTime.toString()}'),
      ),
    );
  }
}
