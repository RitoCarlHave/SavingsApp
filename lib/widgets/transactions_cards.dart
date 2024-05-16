import 'package:flutter/material.dart';

class TransactionsCards extends StatelessWidget {
  const TransactionsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
              children: [
                Text("Recent Transactions", 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    Text("Car Rent Oct 2023"),
                    Text("p 8000", style: TextStyle(color: Colors.green),),
                  ],
                ),
              );
            }),
        ],
      ),
      );
         
            
            
          
      
  }
}