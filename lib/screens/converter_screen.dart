import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';

class ConverterScreen extends StatelessWidget {

  final String name ;

  const ConverterScreen({ this.name});

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
  List<Unit> units = _retrieveUnitList(name);

  final unitWidget = units.map((unit){
    Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(
            unit.name,
          ),
          Text(
            'Conversion: ${unit.conversion}',
          ),
        ],
      ),
    );
  }).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView.builder(
          itemCount: units.length,
          itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(units[index].name),
                  Text("Conversion ${units[index].name}"),

                ],
              ),
            );
          }),
    );
  }


}
