import 'package:flutter/material.dart';
import 'package:meals_app/widgets/mainDraw.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(this.setFilters, this.currentFilters, {Key? key})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  initState() {
    glutenFree = widget.currentFilters['gluten'] as bool;
    vegetarian = widget.currentFilters['lactose'] as bool;
    vegan = widget.currentFilters['vegan'] as bool;
    lactoseFree = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  Widget buildSwitch(
      bool boolValue, String title, String subtitle, Function(bool) function) {
    return SwitchListTile(
      value: boolValue,
      onChanged: function,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters Screen"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.setFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitch(
                  glutenFree, 'Gluten-free', "Only incudes gluten-free meals",
                  (newVal) {
                return setState(() {
                  glutenFree = newVal;
                });
              }),
              buildSwitch(lactoseFree, 'Lactose-free',
                  "Only incudes lactose-free meals", (newVal) {
                return setState(() {
                  lactoseFree = newVal;
                });
              }),
              buildSwitch(vegetarian, 'Vegetarian-free',
                  "Only incudes vegetarian-free meals", (newVal) {
                return setState(() {
                  vegetarian = newVal;
                });
              }),
              buildSwitch(vegan, 'Vegan-free', "Only incudes Vegan-free meals",
                  (newVal) {
                return setState(() {
                  vegan = newVal;
                });
              }),
            ],
          )),
        ],
      ),
    );
  }
}
