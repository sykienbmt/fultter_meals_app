import 'package:flutter/material.dart';
import 'package:meals_app/dataDemo/listCategoryDemo.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext buildContext, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(buildContext).textTheme.bodyText1,
      ),
    );
  }

  Widget buildContainer(Widget widget) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere(((element) => element.id == mealId));

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal detail id: $mealId"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ]);
                }),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
