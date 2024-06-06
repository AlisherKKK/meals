import 'package:flutter/material.dart';
import 'package:foods/screens/tabs.dart';
import 'package:foods/widgits/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: MainDrawer(onSelectScreen: (id) {
        Navigator.of(context).pop();
        if (id == 'meals') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => TabsScreen(),
            ),
          );
        }
      }),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              'Includes only gluten free',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            value: _glutenFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterSet = isChecked;
              });
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              right: 22,
              left: 34,
            ),
          ),
        ],
      ),
    );
  }
}
