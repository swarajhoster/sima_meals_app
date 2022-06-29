import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/onlyForKaan.dart';

import '../screens/categories_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': "Categories"},
    {'page': OnlyForKaan(), 'title': "Muskan"},
  ];

  int _selectPagedIndex = 0;

  void selectPage(int index) {
    setState(() {
      _selectPagedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectPagedIndex]['title']),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/p");
              }, icon: Icon(Icons.favorite),)
        ],
      ),
      drawer: MainDrawer(),
      body: pages[_selectPagedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPagedIndex,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: 'Muskan',
          ),
        ],
      ),
    );
  }
}

// Top navigation Bar :-
// import 'package:flutter/material.dart';
//
// import './categories_screen.dart';
// import './favorites_screen.dart';
//
// class TabsScreen extends StatefulWidget {
//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       initialIndex: 0, // Default which tab should be open
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Sima's Meals App",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "Categories",
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: "Favorites",
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [CategoriesScreen(), FavoritesScreen()],
//         ),
//       ),
//     );
//   }
// }
