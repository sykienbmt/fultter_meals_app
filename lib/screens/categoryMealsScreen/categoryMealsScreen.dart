import 'package:flutter/material.dart';
import 'package:meals_app/dataDemo/listCategoryDemo.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories/widgets/mealItem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routerName = '/category-meals';
  late final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals,{Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late Category category;
  late List<Meal> categoryMeals;
  var loadInitData=false;

  @override
  void didChangeDependencies() {
    if(!loadInitData){
    category = ModalRoute.of(context)!.settings.arguments as Category;
    categoryMeals = widget.availableMeals.where(((element){
      return element.categories.contains(category.id);
    })).toList();
    loadInitData=true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void removeMeal (String idMeal){
    setState(() {
      categoryMeals.removeWhere((element) => element.id==idMeal);
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index],removeMeal);
        },itemCount: categoryMeals.length,
      ),
    );
  }
}
