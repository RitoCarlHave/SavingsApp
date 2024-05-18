import 'package:flutter/material.dart';

//ignore_for_file: prefer_const_constructors

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.selectedIndex, required this.onDestinationSelected});
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(

        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        indicatorColor: Color.fromRGBO(197, 125, 117, 1.0),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long),
            selectedIcon: Icon(Icons.receipt_long, color: Colors.white),
            label: 'receipt_long',
          ),

        ],
      );
  }
}