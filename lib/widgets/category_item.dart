import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.id, this.title, this.color);

  void selecteCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(CategoryMealsScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selecteCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
