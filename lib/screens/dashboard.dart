import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home_screen.dart';
import 'package:flutter_application/screens/settings_screen.dart';
import 'package:flutter_application/screens/transaction_screen.dart';
import 'package:flutter_application/widgets/navbar.dart';

//ignore_for_file: prefer_const_constructors

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
   var pageViewList = [
    HomeScreen(),
    TransactionScreen(),
    SettingsScreen(),
  ]; 

  logOut() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex, 
        onDestinationSelected: (int value) {  
          setState(() {
            currentIndex = value;
          });
        },),
      
      body: pageViewList[currentIndex],

    );
  }
  

}
