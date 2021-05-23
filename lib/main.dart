import 'package:flutter/material.dart';
import 'package:meals_app/dummyData/dummy-data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filterMap ={
    "glutenFilter" : false,
    "lactoseFilter" : false,
    "vegetarianFilter" :false,
    "veganFilter" : false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> newSettingsMap){
    setState(() {
      filterMap=newSettingsMap;

      availableMeals = DUMMY_MEALS.where((meal){
        if (filterMap['glutenFilter']==true&& !meal.isGlutenFree){
          return false;
        }
        if (filterMap['lactoseFilter']==true && !meal.isLactoseFree){
          return false;
        }
        if (filterMap['vegetarianFilter']==true && !meal.isVegetarian){
          return false;
        }
        if (filterMap['veganFilter']==true && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      // home: CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/" : (context) => TabsScreen(),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(),
        FiltersScreen.routeName :(context)=> FiltersScreen(setFilters, filterMap),
      },
      onGenerateRoute: (settings) {
        print('Arguments sent: ${settings.arguments}');
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
