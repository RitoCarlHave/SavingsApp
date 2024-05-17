import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//ignore_for_file: deprecated_member_use

class AppIcons {
  final List<Map<String, dynamic >> homeExpensesCategories = [
    {
      "name": "Gas Filling",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Grocery",
      "icon": FontAwesomeIcons.shoppingCart,
    },
    {
      "name": "Milk",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Internet",
      "icon": FontAwesomeIcons.wifi,
    },

    
  ];


  IconData getExpenseCategoryIcons(String categoryName){
    final category = homeExpensesCategories.firstWhere(
      (category) => category['name'] == categoryName, 
      orElse: () => {"icon": FontAwesomeIcons.shoppingCart},);
    return category['icon'];
  }
}