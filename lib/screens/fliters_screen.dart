import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> _filters;

  FiltersScreen(this._filters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  initState() {
    _glutenFree = widget._filters['gluten'];
    _lactoseFree = widget._filters['lactose'];
    _vegan = widget._filters['vegan'];
    _vegetarian = widget._filters['vegetarian'];
    super.initState();
  }

  Widget bulidSwitchList(
      String title, String SubTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        value: currentValue,
        subtitle: Text(SubTitle),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters Main"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meals selection",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                bulidSwitchList(
                  "Gluten-Free",
                  "Only includes gluten-free meals",
                  _glutenFree,
                  (newValue) => setState(() {
                    _glutenFree = newValue;
                  }),
                ),
                bulidSwitchList(
                  "Lactose-Free",
                  "Only includes lactose-free meals",
                  _lactoseFree,
                  (newValue) => setState(() {
                    _lactoseFree = newValue;
                  }),
                ),
                bulidSwitchList(
                  "Vegetarian-Free",
                  "Only includes vegetarian-free meals",
                  _vegetarian,
                  (newValue) => setState(() {
                    _vegetarian = newValue;
                  }),
                ),
                bulidSwitchList(
                  "Vegan-Free",
                  "Only includes vegan-free meals",
                  _vegan,
                  (newValue) => setState(() {
                    _vegan = newValue;
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
