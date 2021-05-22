import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import '../dummyData/dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((category) => GestureDetector(
              child: CategoryItem(
                    id: category.id,
                    color: category.color,
                    title: category.title,
                  ),
            ),)
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
