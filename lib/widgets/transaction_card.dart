import 'package:flutter/material.dart';
import 'package:flutter_application/utils/icons_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({
    super.key,
    required this.data,
  });
  final dynamic data;
  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(data['timestamp']);
    String formatedDate = DateFormat('d MMM hh:mma').format(date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        margin: EdgeInsets.only(top: 8), // Add some spacing between cards
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey,
              blurRadius: 10.0,
              spreadRadius: 4.0,
            )
          ],
          color: Colors
              .white, // Add background color to make shadow effect visible
        ),
        child: ListTile(
          minVerticalPadding: 10,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),
          leading: Container(
            width: 70,
            height: 100,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: data['type'] == 'credit'
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2)),
              child: Center(
                  child: FaIcon(
                      appIcons.getExpenseCategoryIcons('${data['category']}'),
                      color: data['type'] == 'credit'
                      ? Colors.green
                      : Colors.red
                      ),
                      ),
            ),
          ),
          title: Text("${data['title']}"),
          trailing: Column(
            mainAxisSize: MainAxisSize
                .min, // Ensure the column takes minimal vertical space
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${data['type'] == 'credit' ? '+' : '-'} P${data['amount']}",
                style: TextStyle(
                    color: data['type'] == 'credit'
                      ? Colors.green
                      : Colors.red, fontSize: 13),
              ),
              Text(
                "P ${data['remainingAmount']}",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Balance",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Spacer(),
                ],
              ),
              Text(
                formatedDate,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
