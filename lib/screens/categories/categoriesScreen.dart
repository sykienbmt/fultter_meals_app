import 'package:flutter/material.dart';
import 'package:meals_app/dataDemo/listCategoryDemo.dart';
import 'package:meals_app/screens/categories/widgets/categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
      children: LIST_CATEGORY_DEMO.map((category) {
        return CategoryItem(category);
        }).toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        //height:3 width:2
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
