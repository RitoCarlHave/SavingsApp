import 'package:flutter/material.dart';

class TimeLineMonth extends StatelessWidget {
  const TimeLineMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(itemBuilder: (context, index){
        return Container(
          height: 60,
          child: Text("Oct 2021"),
        );

      }),
    );
  }
}