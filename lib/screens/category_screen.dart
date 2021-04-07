import 'package:flutter/material.dart';
import '../widgets/category.dart';

final _backgroundColor = Colors.deepOrange[100];

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  Widget build(BuildContext context) {
    final List<Category> categories = [];

    for (int i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        icon: Icons.cake,
      ));
    }

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: _buildAppBar(),
      body: _buildCategoryWidgets(categories),
    );
  }

  ListView _buildCategoryWidgets(List<Category> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return categories[index];
        });
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
