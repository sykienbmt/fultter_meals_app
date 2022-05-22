import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories/categoriesScreen.dart';
import 'package:meals_app/screens/favorites/favoritesScreen.dart';
import 'package:meals_app/widgets/mainDraw.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,Object>> pages = [
    {'page':CategoryScreen(),'title':"Categories"},
    {'page':FavoritesScreen(),'title':"Favorites"},
  ];
  int selectPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: pages[selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.cyanAccent,
        currentIndex: selectPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
