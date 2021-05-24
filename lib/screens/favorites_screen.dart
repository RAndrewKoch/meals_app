import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: favoriteMeals.isEmpty
          ? Center(
              child: Text("No meals in favorites!"),
            )
          : Column(children: []),
    );
  }
}
