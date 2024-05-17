import 'package:flutter/material.dart';
import 'package:flutter_application/utils/icons_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore: must_be_immutable
class TransactionsCards extends StatelessWidget {
  TransactionsCards({super.key});

  var appIcons = AppIcons();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(top: 8), // Add some spacing between cards
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
                        color: Colors.green.withOpacity(0.2),
                      ),
                      child: Center(
                        child: FaIcon(
                           appIcons.getExpenseCategoryIcons('home'))),
                    ),
                  ),
                  title: Text("Car Rent Oct 2023"),
                  trailing: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Ensure the column takes minimal vertical space
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "P 8000",
                        style: TextStyle(
                            color: Color.fromRGBO(52, 81, 58, 1.0),
                            fontSize: 13),
                      ),
                      Text(
                        "P 525",
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
                        "25 Oct 4:51 PM",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
