import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meals_app/screens/filtersScreen/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTitle(String text,IconData icon,Function tapHandles) {
      return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(text), 
            onTap: () {tapHandles();},
          );
    }
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          buildListTitle("Meals",Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTitle("Filters", Icons.settings,(){
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
