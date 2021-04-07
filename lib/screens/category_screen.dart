import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/service/ApiService.dart';
import '../widgets/category.dart';

final _backgroundColor = Colors.deepOrange[100];

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categories= [];
  static const _icons = {
    'Length': 'assets/icons/length.png',
    'Area': 'assets/icons/area.png',
    'Volume': 'assets/icons/volume.png',
    'Mass': 'assets/icons/mass.png',
    'Time': 'assets/icons/time.png',
    'Digital Storage': 'assets/icons/digital_storage.png',
    'Energy': 'assets/icons/power.png',
    'Currency': 'assets/icons/currency.png',
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (categories.isEmpty) {
      await _retrieveLocalCategories();
      await _retrieveApiCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        backgroundColor: _backgroundColor,
        appBar: _buildAppBar(),
        body: _buildCategoryWidgets(categories),
      );
    }
  }

  Future<void> _retrieveLocalCategories() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
          data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
        name: key,
        icon: _icons[key],
        units: units,
      );
      setState(() {
        categories.add(category);
      });
      categoryIndex += 1;
    });
  }

  /// Retrieves a [Category] and its [Unit]s from an API on the web
  Future<void> _retrieveApiCategory() async {
    // Add a placeholder while we fetch the Currency category using the API
    setState(() {
      categories.add(Category(
        name: apiCategory['name'],
        icon: _icons['Currency'],
        units: [],
      ));
    });
    final api = ApiService();
    final jsonUnits = await api.getUnits(apiCategory['route']);
    // If the API errors out or we have no internet connection, this category
    // remains in placeholder mode (disabled)
    if (jsonUnits != null) {
      final units = <Unit>[];
      for (var unit in jsonUnits) {
        units.add(Unit.fromJson(unit));
      }
      setState(() {
        categories.removeLast();
        categories.add(Category(
          name: apiCategory['name'],
          icon: _icons['Currency'],
          units: units,
        ));
      });
    }
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
              childAspectRatio: 3),
          itemCount: categories.length,
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
