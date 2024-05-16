import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(197, 125, 117, 1.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
                Text("Total Balance", 
                style: TextStyle(fontSize: 18, 
                color: Colors.white,height: 1.2, 
                fontWeight: FontWeight.w600)),
            
                Text("₱ 100222", 
                style: TextStyle(fontSize: 50, 
                color: Colors.white,height: 1.2, 
                fontWeight: FontWeight.w600)),
            
              ],
            ),
          ),
        //--------///
        Container(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 10,
            left: 10,
            right: 10
            ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white, 
          ),
      
           child: Row(
            children: [
              CardOne(color: Color.fromRGBO(52, 81, 58, 1.0),),
              SizedBox(
                width: 10,
              ),
      
              CardOne(color: Color.fromRGBO(181, 78, 74, 1.0),),
      
            ],
           ),
        ),
        
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({
    super.key, required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)
        ),

        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  "Credit", 
                  style: TextStyle(color: color, fontSize: 14),
                  ), 
                  Text("₱ 100000",
                  style: TextStyle(
                    color: color, 
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_upward_outlined,
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}