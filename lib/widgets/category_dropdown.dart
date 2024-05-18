import 'package:flutter/material.dart';
import 'package:flutter_application/utils/icons_list.dart';

class CategoryDropDown extends StatelessWidget {
  CategoryDropDown({super.key, this.cattype, required this.onChanged});
  final String? cattype;
  final ValueChanged<String?> onChanged;
  final appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    // Extract categories from appIcons and check for uniqueness
    final categories = appIcons.homeExpensesCategories;

    // Debugging: Print categories to ensure they are correctly loaded
    categories.forEach((category) {
      print('Category: ${category['name']}');
    });

    // Check if cattype is one of the available categories
    final isValidCategory = categories.any((category) => category['name'] == cattype);

    if (cattype != null && !isValidCategory) {
      print('Error: Initial value $cattype is not in the list of categories');
    }

    return DropdownButton<String>(
      value: isValidCategory ? cattype : null, // Ensure value is valid
      isExpanded: true,
      hint: Text("Select Category"),
      items: categories
          .map((e) => DropdownMenuItem<String>(
              value: e['name'],
              child: Row(
                children: [
                  Icon(
                    e['icon'],
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    e['name'],
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              )))
          .toList(),
      onChanged: onChanged,
    );
  }
}
