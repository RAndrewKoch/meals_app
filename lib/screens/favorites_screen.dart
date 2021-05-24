import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

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
          : Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(
                    meal: favoriteMeals[index],
                  );
                },
                itemCount: favoriteMeals.length,
              ),
            ),
    );
  }
}
