import 'package:flutter/material.dart';
import 'package:foods/screens/categories.dart';
import 'package:foods/screens/filters.dart';
import 'package:foods/screens/meals.dart';
import 'package:foods/widgits/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPage = 0;
  final List<Meal> _favorites = [];

  void _showInfoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  void _toggleFavorites(Meal meal) {
    final isExists = _favorites.contains(meal);
    if (isExists) {
      setState(() {
        _favorites.remove(meal);
      });
      _showInfoMessage('Meal is no longer favorite');
    } else {
      setState(() {
        _favorites.add(meal);
      });
      _showInfoMessage('Added to favorite');
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  void _setScreen(String id) {
    Navigator.pop(context);
    if (id == 'filter') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: (Meal meal) {
        _toggleFavorites(meal);
      },
    );
    var activePageTitle = 'Categories';
    if (_selectedPage == 1) {
      activePage = MealsScreen(
        meals: _favorites,
        onToggleFavorite: (Meal meal) {
          _toggleFavorites(meal);
        },
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
