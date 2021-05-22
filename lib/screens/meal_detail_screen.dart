import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildListContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Widget itemListCard(BuildContext context, String item) {
    return Card(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text('- $item'),
      ),
    );
  }

  Widget stepListCard(BuildContext context, String step, int index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('#${index + 1}'),
      ),
      title: Text(step),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${meal.duration} Min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${meal.complexityText}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text('${meal.affordabilityText}'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  buildSectionTitle(context, "Ingredients"),
                  buildListContainer(
                    context,
                    ListView.builder(
                      itemCount: meal.ingredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemListCard(
                          context,
                          meal.ingredients[index],
                        );
                      },
                    ),
                  ),
                  buildSectionTitle(context, "Directions"),
                  buildListContainer(
                    context,
                    ListView.builder(
                      itemCount: meal.steps.length,
                      itemBuilder: (BuildContext context, int index) {
                        return stepListCard(
                          context,
                          meal.steps[index],
                          index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
