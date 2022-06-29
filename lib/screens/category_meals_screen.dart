import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;

  // Runs after build is created, so we use this instead of iniState, where we cant use context
  @override
  void didChangeDependencies() {
    // Returns Array of Arguments passed in the Routes Main.dart...
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                displayMeals[index].id,
                displayMeals[index].title,
                displayMeals[index].imageUrl,
                displayMeals[index].duration,
                displayMeals[index].affordability,
                displayMeals[index].complexity,
                () => _removeMeal("m1"));
          },
          itemCount: displayMeals.length,
        ));
  }
}
