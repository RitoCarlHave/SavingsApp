import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/time_line_month.dart';

//ignore_for_file: prefer_const_constructors

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
      ),
      body: Column(
        children: [
          TimeLineMonth()
        ],
      )
    );
  }
}