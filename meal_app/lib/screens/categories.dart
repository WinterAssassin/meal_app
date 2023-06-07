import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  
  void _selectCategory (BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(
            title: category.title, 
            meals: filteredMeals
            );
        }
        )
    );
  }

  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories) 
              CategoryGridItem(
                category: category, 
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
                )
          ],
    );
  }
}