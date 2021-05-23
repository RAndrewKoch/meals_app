import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.setFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters["glutenFilter"] as bool;
    _vegetarian = widget.currentFilters["vegetarianFilter"] as bool;
    _vegan = widget.currentFilters["veganFilter"] as bool;
    _lactoseFree = widget.currentFilters["lactoseFilter"] as bool;
    super.initState();
  }

  Widget buildFilterSwitch({
    required bool currentValue,
    required String title,
    required String subtitle,
    required Function updateValue,
  }) {
    return SwitchListTile(
        onChanged: (_) => updateValue(_),
        value: currentValue,
        title: Text(title),
        subtitle: Text(subtitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () => widget.setFilters({
              "glutenFilter" : _glutenFree,
              "lactoseFilter" : _lactoseFree,
              "vegetarianFilter" :_vegetarian,
              "veganFilter" : _vegan,
            }),
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(
        context: context,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildFilterSwitch(
                      currentValue: _glutenFree,
                      title: "Gluten-Free",
                      subtitle: "Only include gluten-free meals.",
                      updateValue: (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }),
                  buildFilterSwitch(
                      currentValue: _lactoseFree,
                      title: "Lactose-Free",
                      subtitle: "Only include lactose-free meals.",
                      updateValue: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }),
                  buildFilterSwitch(
                      currentValue: _vegetarian,
                      title: "Vegetarian",
                      subtitle: "Only include Vegetarian meals.",
                      updateValue: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }),
                  buildFilterSwitch(
                      currentValue: _vegan,
                      title: "Vegan",
                      subtitle: "Only include vegan meals.",
                      updateValue: (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
