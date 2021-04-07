import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';

class ConverterScreen extends StatefulWidget {

  final String name ;

  const ConverterScreen({ this.name});

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
  List<Unit> units = _retrieveUnitList(widget.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: buildConverterListView(units),
    );
  }

  ListView buildConverterListView(List<Unit> units) {
    return ListView.builder(
        itemCount: units.length,
        itemBuilder: (context,index){
          return buildConverterItem(units, index);
        });
  }

  Container buildConverterItem(List<Unit> units, int index) {
    return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(units[index].name),
                Text("Conversion ${units[index].name}"),

              ],
            ),
          );
  }
}
