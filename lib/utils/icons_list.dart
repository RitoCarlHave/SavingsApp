import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//ignore_for_file: deprecated_member_use

class AppIcons {
  final List<Map<String, dynamic >> homeExpensesCategories = [
    {
      "name": "Emergency Fund",
      "icon": FontAwesomeIcons.circleExclamation,
    },
    {
      "name": "Grocery",
      "icon": FontAwesomeIcons.shoppingCart,
    },
    {
      "name": "Loans",
      "icon": FontAwesomeIcons.receipt,
    },
    {
      "name": "Child Care",
      "icon": FontAwesomeIcons.child,
    },
    {
      "name": "Savings",
      "icon": FontAwesomeIcons.piggyBank,
    },
    {
      "name": "Maintainance",
      "icon": FontAwesomeIcons.toolbox,
    },
    {
      "name": "Pet Care",
      "icon": FontAwesomeIcons.dog,
    },
    {
      "name": "Bills/Payments",
      "icon": FontAwesomeIcons.creditCard,
    },
    {
      "name": "Dining Out",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Subscription",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Healthcare",
      "icon": FontAwesomeIcons.medkit,
    },
    {
      "name": "Transportation",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Shopping",
      "icon": FontAwesomeIcons.tags,
    },
    {
      "name": "Salary",
      "icon": FontAwesomeIcons.moneyBillWave,
    },
    {
      "name": "Education",
      "icon": FontAwesomeIcons.graduationCap,
    },
    {
      "name": "Others",
      "icon": FontAwesomeIcons.solidCircleQuestion,
    },

    
  ];


  IconData getExpenseCategoryIcons(String categoryName){
    final category = homeExpensesCategories.firstWhere(
      (category) => category['name'] == categoryName, 
      orElse: () => {"icon": FontAwesomeIcons.shoppingCart},);
    return category['icon'];
  }
}