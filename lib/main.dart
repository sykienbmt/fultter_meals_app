import 'package:flutter/material.dart';
import 'package:meals_app/dataDemo/listCategoryDemo.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/404/errPage.dart';
import 'package:meals_app/screens/categories/categoriesScreen.dart';
import 'package:meals_app/screens/categoryMealsScreen/categoryMealsScreen.dart';
import 'package:meals_app/screens/filtersScreen/filterScreen.dart';
import 'package:meals_app/screens/home.dart';
import 'package:meals_app/screens/mealDetail/mealDetailScreen.dart';
import 'package:meals_app/widgets/tabsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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

  List<Meal> availableMeals= DUMMY_MEALS;

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;

      availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StarrMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.deepPurpleAccent,
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Pangolin',
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Quicksand',
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routerName: ((context) => CategoryMealsScreen(availableMeals)),
        MealDetailScreen.routeName: ((context) => MealDetailScreen()),
        FilterScreen.routeName: (context) => FilterScreen(setFilters,_filters),
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: ((context) => CategoryScreen()));
      // },
      onUnknownRoute: (context) {
        return MaterialPageRoute(builder: ((context) => Err404Page()));
      },
    );
  }
}
