import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/dummy_data.dart';
import 'package:flutter_complete_guide/screens/fliters_screen.dart';
import 'package:flutter_complete_guide/screens/kaanKaPhoto.dart';
import 'package:flutter_complete_guide/screens/onlyForKaan.dart';
import 'package:flutter_complete_guide/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filteredData){
      setState((){
        _filters = filteredData;

       _availableMeals = DUMMY_MEALS.where((meal) {
          if(_filters['gluten'] && !meal.isGlutenFree) return false;
          if(_filters['lactose'] && !meal.isLactoseFree) return false;
          if(_filters['vegan'] && !meal.isVegan) return false;
          if(_filters['vegetarian'] && !meal.isVegetarian) return false;
          return true;
        }).toList();
      });
  }


  @override
  Widget build(BuildContext context) {
    
  }
}
