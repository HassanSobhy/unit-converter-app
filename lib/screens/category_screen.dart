import 'package:flutter/material.dart';
import '../widgets/category.dart';

final _backgroundColor = Colors.deepOrange[100];

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categories;
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = [];
    for (int i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        icon: Icons.cake,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _buildAppBar(),
      body: _buildCategoryWidgets(categories),
    );
  }

  Widget _buildCategoryWidgets(List<Category> categories) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return categories[index];
          });
    } else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            childAspectRatio: 3
          ),itemCount: categories.length,
          itemBuilder: (context, index) {
            return categories[index];
          });
    }
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Unit Converter",
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }
}
